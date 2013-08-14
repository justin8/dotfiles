pulseaudio -D &
case $1 in
kde)
	exec startkdi
	;;
cinnamon)
	exec gnome-session-cinnamon
	;;
i3|*)
	exec i3 > ~/.config/i3/log 2>&1
	;;
esac
