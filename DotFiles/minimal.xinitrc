xcompmgr &
xset -b &
xautolock -time 10 -locker slock &
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
feh --bg-scale /home/eric/Pictures/Backgrounds/Space\ 20.jpg &
xsetroot -cursor_name left_ptr &
xbindkeys &

exec urxvt --geometry 220x60+21+22
