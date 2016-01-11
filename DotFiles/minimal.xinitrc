# Start the compositor
xcompmgr &

# Turn of the bell (Avoid computer beeping)
xset -b &

# Have X autolock the computer if left idle for 10 minutes with slock
xautolock -time 10 -locker slock &

# If Xresources is found, use it
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Have feh set the background and scale it
feh --bg-scale /home/eric/Pictures/Backgrounds/TheEndOfTime.jpg &

# Set the cursor in X
xsetroot -cursor_name left_ptr &

# Use custom key bindings
xbindkeys &

# Turn off touchpad
synclient TouchpadOff=1 &

# Call X with urxvt center (May have to adjust on different computers)
exec urxvt --geometry 220x60+21+22
