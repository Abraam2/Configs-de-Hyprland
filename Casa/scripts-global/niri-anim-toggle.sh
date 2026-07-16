#!/bin/bash

# Configuración
ANIM_DIR="$HOME/.config/niri/animations"
CURRENT_LINK="$ANIM_DIR/current_animation.kdl"

# 1. Obtener todos los archivos .kdl en un array nativo de Bash (sin usar ls)
FILES=()
for file in "$ANIM_DIR"/*.kdl; do
    # Evitamos meter el propio enlace simbólico en la lista de rotación
    if [[ "$file" != "$CURRENT_LINK" ]]; then
        FILES+=("$file")
    fi
done

# Comprobar si la carpeta está vacía
if [ ${#FILES[@]} -eq 0 ]; then
    notify-send "Niri Error" "No se encontraron animaciones en $ANIM_DIR"
    exit 1
fi

# 2. Identificar la animación actual comparando SOLO el nombre del archivo (basename)
CURRENT_TARGET=$(readlink "$CURRENT_LINK")
CURRENT_NAME=$(basename "$CURRENT_TARGET")

NEXT_INDEX=0
for i in "${!FILES[@]}"; do
    FILE_NAME=$(basename "${FILES[$i]}")

    # Al comparar solo "bloom.kdl" == "bloom.kdl", da igual cómo sean las rutas de largas
    if [[ "$FILE_NAME" == "$CURRENT_NAME" ]]; then
        NEXT_INDEX=$(((i + 1) % ${#FILES[@]}))
        break
    fi
done

# 3. Actualizar el enlace simbólico
NEW_ANIM="${FILES[$NEXT_INDEX]}"
rm -f "$CURRENT_LINK"
ln -s "$NEW_ANIM" "$CURRENT_LINK"

# 4. Notificar al usuario
ANIM_NAME=$(basename "$NEW_ANIM" .kdl)
DISPLAY_NAME="${ANIM_NAME^}"

notify-send -a "Niri Switcher" -r 101 "Niri Visuals" "Now using: $DISPLAY_NAME" -i "video-display" -t 1500
