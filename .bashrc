# If not running interactively, don't do anything.
[ -z "$PS1" ] && return

# Only the best.
export EDITOR=/usr/bin/vim

# Add current dir to path.
export PATH=$PATH:.

# Aliases
alias pdf='evince'
alias grep='egrep --color'
alias last='last -n 40'
alias gs='git status'
alias gcom='git commit -am'
alias gcm='git checkout master'
alias hgrep='history | egrep --color'
alias gmm='git merge master'
alias gg='git grep --color -n'
alias vs='vim -O'

# COLORS.
if [ -x /usr/bin/dircolors ]; then
  eval "`dircolors -b`"
  alias ls='ls --color=auto'
fi

# Good ol bash completion.
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# Command edition in vi mode.
set -o vi

# Append to the history file, don't overwrite it.
shopt -s histappend
# NO DUPLICATES.
export HISTCONTROL=erasedups

# Lots o history.
HISTSIZE=100000

# Check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS.
shopt -s checkwinsize

# Set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# Please colors.
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
  else
    color_prompt=
  fi
fi

# Basic hash on string (sum all characters).
function hash_str {
  local str=$1
  local sum=0
  for ((i=0; i<${#str}; i++)); do
    sum=$(($sum + $(printf '%d' \'${str:$i:1})))
  done
  echo $sum
}

source ~/.git-prompt.sh
if [ "$color_prompt" = yes ]; then
  # Seed random with hash of hostname.
  RANDOM=$(hash_str $HOSTNAME$USER)
  PS1='\[\e[01;'$(($RANDOM % 6 + 31))'m\]\u\[\e[00m\]@\[\e[01;'$(($RANDOM % 6 + 31))'m\]\h\[\e[00m\](\[\e[01;'$(($RANDOM % 6 + 31))'m\]$(__git_ps1 "%s")\[\e[00m\])\[\e[01;'$(($RANDOM % 6 + 31))'m\]\w\[\e[00m\]\$ '
  RANDOM=$$
else
  PS1='\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

ssh-agent > /dev/null
