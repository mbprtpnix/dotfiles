#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# [[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	startx
fi
