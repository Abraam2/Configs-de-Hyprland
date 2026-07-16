#!/usr/bin/env bash

# Si cancelas el slurp (escapas con la tecla Esc), salimos del script sin hacer nada
GEOMETRIA=$(slurp)
[ -z "$GEOMETRIA" ] && exit 0

grim -g "$GEOMETRIA" - | satty --filename - --output-filename "$HOME/Imágenes/$(date '+%Y-%m-%d_%H-%M-%S').png"
