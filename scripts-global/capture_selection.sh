#!/usr/bin/env bash

# Si cancelas el slurp (escapas con la tecla Esc), salimos del script sin hacer nada
GEOMETRIA=$(slurp)
[ -z "$GEOMETRIA" ] && exit 0

# Ejecutamos toda la vaina limpia
grim -g "$GEOMETRIA" - | tee "$HOME/Imágenes/$(date +'%Y-%m-%d_%H-%M-%S').png" | wl-copy -t image/png && notify-send "Captura completada" "Guardada en ~/Imágenes y copiada al portapapeles"
