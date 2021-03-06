#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc



#export TMOUT=600

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] &&  ! [[ -e /tmp/.X11-unix/X0 ]] && (( EUID )); then
    while true; do
	read -p 'Set brightness (0-255): '
	brightness set $REPLY
	if [ $? -eq 0 ]; then
	    break
	fi
    done
    while true; do
	read -p 'Do you want to start X? (y/n/u/e/x): '
	case $REPLY in
	    [Yy]) exec startx ;;
	    [Uu]) exec startx ~/.xinitrc-univer ;;
	    [Ee]) exec startx ~/.xinitrc-escapism ;;
	    [Xx]) exec startxfce4 ;;
	    [Nn]) break ;;
	    *) printf '%s\n' 'Please answer y/n/u/e.' ;;
	esac
    done
fi
