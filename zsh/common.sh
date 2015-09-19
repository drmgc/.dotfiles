
autoload -U colors && colors

for color in red green yellow blue magenta cyan black white; do
    eval $color='%{$fg_no_bold[${color}]%}'
    eval ${color}_bold='%{$fg_bold[${color}]%}'
done

reset="%{$reset_color%}"


if [[ -n "$SSH_CLIENT" || -n "$SSH2_CLIENT" ]]; then
  host="${black}[${mageneta}%m${black}] "
else
  unset host
fi


setopt prompt_subst
if [ "$EUID" -eq 0 ]; then
  PROMPT="${host}${red_bold}[${cyan}%~${red_bold}]${reset} "
else
  PROMPT="${host}${white_bold}[${cyan}%~${white_bold}]${reset} "
fi

git_prompt() {
  temp=`git symbolic-ref HEAD 2>/dev/null | cut -d / -f 3`
  if [ "$temp" != "" ]; then echo "[$temp]"; fi
}
export RPROMPT='$(git_prompt)'


HISTFILE=$HOME/.zsh_history
HISTSIZE=9999
SAVEHIST=9999

setopt extended_history
setopt inc_append_history
setopt share_history

setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks


setopt correctall
setopt autocd
setopt extended_glob
setopt interactive_comments
# WORDCHARS=''@"

autoload -U compinit && compinit

_comp_options+=(globdots)

zstyle ':completion:*' menu select


bindkey "^[OH"  beginning-of-line
bindkey "^[OF"  end-of-line

bindkey "^[[A"  history-beginning-search-backward
bindkey "^[[B"  history-beginning-search-forward

bindkey '^[[1;5D'   backward-word
bindkey '^[[1;5C'   forward-word
