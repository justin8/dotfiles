xrandr --output DVI-I-1 --auto --primary --output DVI-D-0 --auto --left-of DVI-I-1
/usr/lib/systemd/systemd --user &
pulseaudio --start &

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
