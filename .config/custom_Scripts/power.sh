#!/usr/bin/env bash
#   ___
#  / _ \___ _     _____ ____
# / ___/ _ \ |/|/ / -_) __/
#/_/   \___/__,__/\__/_/
#

ARCHIVO_LOG="$HOME/Documentos/tiempos_qbittorrent.log"

# Pillamos el entorno y lo pasamos a minúsculas
DESKTOP="${XDG_CURRENT_DESKTOP,,}"

terminate_clients() {
    # 1. Cierre de aplicaciones optimizado por entorno
    if [[ "$DESKTOP" == *"hyprland"* ]]; then
        # En Hyprland seguimos usando tu método original por PIDs
        client_pids=$(hyprctl clients -j | jq -r '.[] | select(.initialClass != "quickshell") | .pid' 2>/dev/null)
        if [ -n "$client_pids" ]; then
            echo ":: Cerrando aplicaciones en Hyprland..."
            echo "$client_pids" | xargs kill -15 2>/dev/null
            for _ in {1..5}; do
                if ! kill -0 "$client_pids" 2>/dev/null; then break; fi
                sleep 0.1
            done
            echo "$client_pids" | xargs kill -9 2>/dev/null
        fi

    elif [[ "$DESKTOP" == *"niri"* ]]; then
        # En Niri usamos el cierre nativo por IDs para que sea ultra amable
        echo ":: Cerrando aplicaciones de forma nativa en Niri..."
        niri msg -j windows 2>/dev/null | jq -r '.[] | select(.app_id != "quickshell") | .id' | while read -r id; do
            niri msg action close-window --id "$id" 2>/dev/null
        done
        # Le damos un pelín de margen para que terminen de procesar el cierre
        sleep 0.5
    fi

    # 2. Cierre y medición de qBittorrent
    if systemctl --user is-active --quiet qbittorrent-nox.service; then
        echo ":: Deteniendo qBittorrent..."
        echo "--- Fecha: $(date '+%Y-%m-%d %H:%M:%S') ---" >>"$ARCHIVO_LOG"

        inicio=$(date +%s.%N)
        systemctl --user stop --wait qbittorrent-nox.service
        fin=$(date +%s.%N)
        duracion=$(awk -v t1="$inicio" -v t2="$fin" 'BEGIN{printf "%.3f", t2-t1}')

        echo "Intento $INTENTO | qbittorrent tardó: $duracion segundos" >>"$ARCHIVO_LOG"
        echo "" >>"$ARCHIVO_LOG"
    fi

    # 3. Listeners
    if [ -f "$HOME/.config/ml4w/listeners.sh" ]; then
        bash "$HOME/.config/ml4w/listeners.sh" --stopall
    fi
}

# --- COMANDOS DEL SISTEMA ---
if [[ "$1" == "exit" ]]; then
    terminate_clients
    if [[ "$DESKTOP" == *"hyprland"* ]]; then
        hyprctl dispatch 'hl.dsp.exit()'
    elif [[ "$DESKTOP" == *"niri"* ]]; then
        niri msg action quit --skip-confirmation
    else
        loginctl terminate-user "$USER"
    fi
fi

if [[ "$1" == "lock" ]]; then
    if command -v playerctl >/dev/null 2>&1; then playerctl -a pause; fi

    if [[ "$DESKTOP" == *"hyprland"* ]]; then
        hyprlock
    elif [[ "$DESKTOP" == *"niri"* ]]; then
        # He puesto el script que tenías en tu config de Niri para el atajo Mod+Alt+L
        bash "$HOME/.local/share/quickshell-lockscreen/lock.sh"
    else
        # Bloqueo genérico para desktop normal
        loginctl lock-session
    fi
fi

if [[ "$1" == "reboot" ]]; then
    terminate_clients
    systemctl reboot
fi

if [[ "$1" == "shutdown" ]]; then
    terminate_clients
    systemctl poweroff
fi

if [[ "$1" == "suspend" ]]; then
    sleep 0.2
    systemctl suspend
fi

if [[ "$1" == "hibernate" ]]; then
    sleep 0.2
    systemctl hibernate
fi
