# ~/.bashrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# include .bash_aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
# include .bash_prompt
if [ -f ~/.bash_prompt ]; then
  . ~/.bash_prompt
fi

export HISTTIMEFORMAT="%F %T "

echo "
OS:        $(uname -o)
Distro:    $(grep -w NAME /etc/os-release | cut -d '"' -f2) $(uname -m)
Version:   $(grep -w VERSION /etc/os-release | cut -d '"' -f2)
Kernel:    $(uname -r)
Timezone:  $(cat /etc/timezone)
Uptime:    $(uptime -p)
"

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
