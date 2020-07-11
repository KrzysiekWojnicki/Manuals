######
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias X='startx'
alias ll='ls -la'
alias z='shutdown'
alias r='ranger'


export VISUAL=vim
export EDITOR="$VISUAL"

PS1='[\u@\h \W]\$ '


# path dla java JDK
export PATH=/home/anna/Java/jdk-14.0.1/bin:$PATH
export PATH=/home/$USER/Java/jdk-14.0.1/bin:$PATH

