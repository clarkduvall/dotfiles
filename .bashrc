# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export EDITOR=/usr/bin/vim
export PATH=$PATH:~/.gem/ruby/2.1.0/bin:~/bin/:$EC2_HOME:.
export HISTCONTROL=ignoredups

# Aliases
alias pdf='evince'
alias grep='egrep --color'
alias last='last -n 40'
alias gs='git status'
alias gcom='git commit -am "cduvall: small changes"'
alias gco='git commit -am'
alias gcm='git checkout master'
alias hgrep='history | egrep'
alias gdel='git branch -D'
alias gmm='git merge master'
alias gg='git grep --color -n'
alias writer='libreoffice --writer'
alias calc='libreoffice --calc'
alias vs='vim -O'
alias cgrav='cd ~/shared/apps/gravity-evolved/gravity/src'
alias cjel='cd ~/school/jellybean/Workspace/HerokuServer/src/django/jellybean'
alias playraw='play --rate 11000 -e signed-integer -b 16'
alias sshatom='ssh -i ~/amazon/atomkey.pem ec2-user@54.218.95.24'
#alias sshwatto='ssh 71.177.152.161 -p 2222'
alias sshwatto='ssh 192.168.1.7 -p 2222'
alias vcommit='git commit -am "`cat ~/shared/apps/gravity-evolved/gravity/version`"'

if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

set -o vi

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
   #PS1='\[\e[01;32m\]\u@\h\[\e[0m\]:\[\e[01;35m\]$(__git_ps1 "%s")\[\e[0m\]:\[\e[01;34m\]\w\[\e[0m\]\$ '
   #PS1="\n\[\033[1;37m\]\342\224\214($(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;34m\]\u@\h'; fi)\[\033[1;37m\])\342\224\200(\$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]\342\234\223\"; else echo \"\[\033[01;31m\]\342\234\227\"; fi)\[\033[1;37m\])\342\224\200(\[\033[1;34m\]\@ \d\[\033[1;37m\])\[\033[1;37m\]\n\342\224\224\342\224\200(\[\033[1;32m\]\w\[\033[1;37m\])\342\224\200(\[\033[1;32m\]\$(ls -1 | wc -l | sed 's: ::g') files, \$(ls -lah | grep -m 1 total | sed 's/total //')b\[\033[1;37m\])\342\224\200> \[\033[0m\]"
   PS1='${debian_chroot:+($debian_chroot)}\[\033[01;30m\]\u\[\033[00;37m\]@\[\033[01;34m\]\h\[\033[00m\]:\[\033[01;33m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

ssh-agent > /dev/null
