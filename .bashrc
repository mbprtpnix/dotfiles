#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.bashrc-personal ]] && . ~/.bashrc-personal

source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

source ~/.bash_completion.d/complete_alias
complete -F _complete_alias config

alias chckup='checkupdates | wc -l'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

export TERM="xterm-256color"
export GPG_TTY=$(tty)

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
