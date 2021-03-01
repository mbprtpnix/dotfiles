#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.bashrc-personal ]] && . ~/.bashrc-personal

[[ -f ~/.bash/keep.bash ]] && . ~/.bash/keep.bash

source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

source ~/.bash_completion.d/complete_alias
complete -F _complete_alias config

alias chckup='checkupdates | wc -l'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

export TERM="xterm-256color"
export GPG_TTY=$(tty)
export EDITOR=nvim

### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

### ARCHIVE EXTRACTION
# Usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

PS1='[\u@\h \W]\$ '

# nvm
source /usr/share/nvm/init-nvm.sh
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec


### SHOPT
shopt -s autocd 		# change to named directory
shopt -s cdspell 		# autocorrects cd misspellings
shopt -s cmdhist 		# save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend 		# do not overwrite history
shopt -s expand_aliases 	# expand aliases
shopt -s checkwinsize 		# checks term size when bash regains control


### SET MANPAGER
### Uncomment only one of these!

### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

### "vim" as manpager
# export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

### "nvim" as manpager
# export MANPAGER="nvim -c 'set ft=man' -"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/master/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/master/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/master/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/master/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

