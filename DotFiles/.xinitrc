# Starts the compositor
xcompmgr &

# Turns off the bell noise (Avoid beeping computer)
xset -b &

# Starts the urxvt daemon with fork, open display, and quiet options
urxvtd -f -o -q &

# Autolock the computer if left idle for 10 minutes with slock
xautolock -time 10 -locker slock &

# If Xresources exists, load it
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Set the background and scale it
feh --bg-scale ~/Pictures/Backgrounds/FallColors.jpg &

# Set the cursor in the x session
xsetroot -cursor_name left_ptr &

# Turn off touchpad
synclient TouchpadOff=1 &

# Start up xmonad (WM)
exec xmonad
