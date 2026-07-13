#!/bin/bash
# Si cancelas el slurp (escapas con la tecla Esc), salimos del script sin hacer nada
GEOMETRIA=$(slurp)
[ -z "$GEOMETRIA" ] && exit 0

# Ejecutamos toda la vaina limpia
grim -g "$GEOMETRIA" - | tesseract stdin stdout -l eng+spa | wl-copy
