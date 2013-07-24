case $1 in
cinnamon)
	exec gnome-session-cinnamon
	;;
enlightenment17)
	exec enlightenment_start
	;;
i3|*)
	exec i3 -V > .config/i3/i3.log 2>&1
	;;
esac
