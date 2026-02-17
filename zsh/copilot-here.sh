copilot_here() {
  # --- SECURITY CHECK ---
  if ! gh auth status 2>/dev/null | grep "Token scopes:" | grep -q "'copilot'"; then
    echo "❌ Error: Your gh token is missing the required 'copilot' scope."
    echo "Please run 'gh auth refresh -h github.com -s copilot' to add it."
    return 1
  fi
  if gh auth status 2>/dev/null | grep "Token scopes:" | grep -q -E "'(admin:|manage_|write:public_key|delete_repo|(write|delete)_packages)'"; then
    echo "⚠️  Warning: Your GitHub token has highly privileged scopes (e.g., admin:org, admin:enterprise)."
    printf "Are you sure you want to proceed with this token? [y/N]: "
    read confirmation
    local lower_confirmation
    lower_confirmation=$(echo "$confirmation" | tr '[:upper:]' '[:lower:]')
    if [[ "$lower_confirmation" != "y" && "$lower_confirmation" != "yes" ]]; then
      echo "Operation cancelled by user."
      return 1
    fi
  fi
  # --- END SECURITY CHECK ---
  local image_name="ghcr.io/gordonbeeming/copilot_here:latest"
  printf "Checking for the latest version of copilot_here... "
  (docker pull "$image_name" >/dev/null 2>&1) &
  local pull_pid=$!
  local spin='|/-\'
  local i=0
  while ps -p $pull_pid >/dev/null; do
    i=$(((i + 1) % 4))
    printf "%s\b" "${spin:$i:1}"
    sleep 0.1
  done
  wait $pull_pid
  local pull_status=$?
  if [ $pull_status -eq 0 ]; then
    echo "✅"
  else
    echo "❌"
    echo "Error: Failed to pull the Docker image. Please check your Docker setup and network."
    return 1
  fi
  local copilot_config_path="$HOME/.config/copilot-cli-docker"
  mkdir -p "$copilot_config_path"
  local token=$(gh auth token 2>/dev/null)
  if [ -z "$token" ]; then
    echo "⚠️  Could not retrieve token using 'gh auth token'. Please ensure you are logged in."
  fi
  local docker_args=(
    --rm -it
    -v "$(pwd)":/work
    -v "$copilot_config_path":/home/appuser/.copilot
    -e PUID=$(id -u)
    -e PGID=$(id -g)
    -e GITHUB_TOKEN="$token"
    "$image_name"
  )
  if [ $# -eq 0 ]; then
    docker run "${docker_args[@]}" copilot --banner
  else
    docker run "${docker_args[@]}" copilot -p "$*"
  fi
}
