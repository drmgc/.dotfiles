
h() {
	if [[ -z "$1" ]]; then
		history
	else
		history 0 | grep "$*"
	fi
}

alias ls="ls --color=auto"
alias lsG="ls --group-directories-first"
alias l="lsG -lAh"
alias ll="lsG -Ah"
alias lll="lsG -l"
alias g='grep'
alias t="touch"

alias gulp="gulp --require coffee-script/register"

# Aptitude
# alias ahelp='alias | grep aptitude'
alias ain='sudo aptitude install'
alias arm='sudo aptitude remove'
alias apu='sudo aptitude purge'
alias ahold='sudo aptitude hold'
alias aunhold='sudo aptitude unhold'
alias aauto='sudo aptitude markauto'
alias aunauto='sudo aptitude unmarkauto'
alias aforbid='sudo aptitude forbid'
alias aup='sudo aptitude update'
alias aupg='sudo aptitude update && sudo aptitude safe-upgrade'
alias afullupg='sudo aptitude update && sudo aptitude full-upgrade'
alias ase='aptitude search'
alias ash='aptitude show'
alias aver='aptitude versions'
#alias acln='sudo aptitude clean'
alias aacln='sudo aptitude autoclean'
alias achlog='aptitude changelog'
alias adload='aptitude download'
alias arein='sudo aptitude reinstall'
alias awhy='aptitude why'
alias awhynt='aptitude why-not'

# Mount
alias mnt='sudo mount -o umask=000'
alias unmnt='sudo umount'

# Gource
alias gourcew='gource -w --highlight-all-users --highlight-dirs --user-image-dir ~/content/Images/Pictures --user-scale 1'
alias gourceh='gource -1920x1080 -f --highlight-all-users --highlight-dirs --user-image-dir ~/content/Images/Pictures --user-scale 1'

# Git
alias ga="git add"
alias gA="git add -A"
alias gpush="git push"
alias gstl="git status"
alias gst="git status -s"
alias gci="git commit"
alias gcim="git commit -m"
alias gbr="git branch"
alias gmkbr="git checkout -b"
alias gco="git checkout"
alias gl="git hist"
alias gL="git log"
alias gdff="git diff"
alias gre="git rebase"

# Пути
alias s="cd ~/sandbox"
alias p="cd ~/prj"
