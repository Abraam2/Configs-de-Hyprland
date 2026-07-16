#!/usr/bin/env bash

# Ruta a tu config (asegúrate de que es esta)
CONFIG_FILE="$HOME/.config/niri/config.kdl"

# Buscamos los binds con título, limpiamos argumentos raros y formateamos para Rofi
grep 'hotkey-overlay-title=' "$CONFIG_FILE" | awk '
{
    # El primer elemento siempre es el atajo (ej: Mod+Q)
    atajo = $1
    
    # Buscamos dónde empieza el texto del título
    match($0, /hotkey-overlay-title="([^"]*)"/, arr)
    titulo = arr[1]
    
    # Escupimos en dos líneas separadas por un salto para el formato -eh 2 de Rofi
    if (titulo != "") {
        printf "%s\n➔ %s\0", atajo, titulo
    }
}' | rofi -dmenu -replace -p "Keybinds" -sep '\0' -eh 2 -config ~/.config/rofi/config-compact.rasi
