#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.bashrc-personal ]] && . ~/.bashrc-personal

alias chckup='checkupdates | wc -l'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
