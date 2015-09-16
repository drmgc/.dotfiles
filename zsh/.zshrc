####
#### Colors
autoload -U colors && colors

for color in red green yellow blue magenta cyan black white; do
    eval $color='%{$fg_no_bold[${color}]%}'
    eval ${color}_bold='%{$fg_bold[${color}]%}'
done

reset="%{$reset_color%}"




####
#### SSH
if [[ -n "$SSH_CLIENT" || -n "$SSH2_CLIENT" ]]; then
  host="${black}[${mageneta}%m${black}] "
else
  unset host
fi




####
#### Promt
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




####
#### History
HISTFILE=$HOME/.zsh_history
HISTSIZE=9999
SAVEHIST=9999

setopt extended_history
setopt inc_append_history
setopt share_history

setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks




####
#### etc.
setopt correctall
setopt autocd
setopt extended_glob
setopt interactive_comments
WORDCHARS=''@"
export EDITOR="vim" # "

export GREP_OPTIONS='--color=auto'
export LS_OPTIONS='--color=auto'

autoload -U compinit && compinit

_comp_options+=(globdots)

zstyle ':completion:*' menu select




####
#### Bindings
bindkey "^[OH"  beginning-of-line
bindkey "^[OF"  end-of-line

bindkey "^[[A"  history-beginning-search-backward
bindkey "^[[B"  history-beginning-search-forward

bindkey '^[[1;5D'   backward-word
bindkey '^[[1;5C'   forward-word




####
#### Aliases
h() {
	if [[ -z "$1" ]]; then
		history
	else
		history 0 | grep "$*"
	fi
}

if [[ "`uname`" == "FreeBSD" ]]; then
	alias l='ls -lAh'
else
	alias l='ls -lAh --color=auto --group-directories-first'
	alias ll='ls -Ah --color=auto --group-directories-first'
	alias ls='ls --color=auto --group-directories-first'
	alias lg='ll | grep'
fi
alias g='grep'
alias se='sudoedit'

alias offmn='sleep 1; xset dpms force off'

# utils
acktodos() {
	ack TODO $*
	ack FIXME $*
}

# Aptitude
alias ahelp='alias | grep aptitude'

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

alias lockscr="i3lock -c 000000"

alias emacsnw="emacs -nw"

#alias gitadd='git add'
#alias gitrm='git rm'
#alias gitpush='git push'
#alias gitpop='git pop'
#alias gitfetch='git fetch'
#alias gitst='git status'
#alias githst='git status -s'
#alias gitci='git commit'
#alias gitbr='git branch'
#alias gitco='git checkout'
#alias githist='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'




export DEBFULLNAME="Sergey Naumov"
export DEBEMAIL="drmgc@yandex.ru"
export PATH="$PATH:$HOME/local/bin:$HOME/local/games:$HOME/.cabal/bin"
export MAKEFLAGS="-j16"

export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"

export TERM="xterm-256color"
