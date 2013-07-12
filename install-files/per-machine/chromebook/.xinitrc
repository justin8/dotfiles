xset -dpms
xset s off

#Fix chromebook sound
amixer set 'Speaker' 0
amixer set 'Right Speaker Mixer Right DAC1' unmute
amixer set 'Left Speaker Mixer Right DAC1' unmute

exec i3 -V >> ~/.config/i3/i3.log 2>&1
