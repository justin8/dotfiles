/usr/lib/systemd/systemd --user &

case $1 in
cinnamon)
	exec gnome-session-cinnamon
	;;
enlightenment17)
	exec enlightenment_start
	;;
i3|*)
	xrandr --output DVI-I-2 --mode 1920x1080 --output DVI-I-1 --mode 1920x1200 --right-of DVI-I-2
	exec i3 -V > .config/i3/i3.log 2>&1
	;;
esac
