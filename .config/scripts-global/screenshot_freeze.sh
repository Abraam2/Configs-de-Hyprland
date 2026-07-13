#!/bin/bash

# Placement: ~/.local/bin/screenshot.sh

#hyprctl setcursor xcursor-transparent 24 &
wayfreeze --after-freeze-cmd 'grim -g "$(slurp)" - | tee ~/Imágenes/$(date +%Y-%m-%d_%H-%M-%S).png | wl-copy -t image/png; killall wayfreeze'
#hyprctl setcursor Adwaita 24 &
