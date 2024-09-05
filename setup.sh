setxkbmap us -option caps:escape -option altwin:swap_alt_win
xrandr --output HDMI-1 --auto --same-as eDP-1
xrandr --output eDP-1 --auto --primary --right-of HDMI-1 --mode 1920x1080 --auto
feh --bg-fill ~/Pictures/mac.jpg
