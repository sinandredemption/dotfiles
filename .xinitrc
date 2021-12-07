xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
./scripts/set_backlight.sh&
#./.config/dwm/statusbar.sh&
nitrogen --restore &
xbindkeys &
dwmblocks&
xrdb -merge ~/.Xresources
exec dwm

