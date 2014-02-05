xcompmgr &
xset -b &
urxvtd -f -o -q &
xautolock -time 10 -locker slock &
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
feh --bg-scale /home/eric/Pictures/Backgrounds/AutumnLeaves.jpg &
xsetroot -cursor_name left_ptr &

exec xmonad
