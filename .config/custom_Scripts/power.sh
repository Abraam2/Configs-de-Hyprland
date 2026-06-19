#!/usr/bin/env bash
#   ___
#  / _ \___ _    _____ ____
# / ___/ _ \ |/|/ / -_) __/
#/_/   \___/__,__/\__/_/
#

ARCHIVO_LOG="$HOME/Documentos/tiempos_qbittorrent.log"
terminate_clients() {
    # 1. Cierre de aplicaciones (Con el fix de Spotify)
    client_pids=$(hyprctl clients -j | jq -r '.[] | select(.initialClass != "quickshell") | .pid')
    if [ -n "$client_pids" ]; then
        echo ":: Cerrando aplicaciones..."
        echo "$client_pids" | xargs kill -15 2>/dev/null
        for _ in {1..5}; do
            if ! kill -0 "$client_pids" 2 >/dev/null; then
                break
            fi
            sleep 0.1
        done
        echo "$client_pids" | xargs kill -9 2>/dev/null
    fi

    # 2. Cierre y medición de qBittorrent
    if systemctl --user is-active --quiet qbittorrent-nox.service; then
        echo ":: Deteniendo qBittorrent..."
        echo "--- Fecha: $(date '+%Y-%m-%d %H:%M:%S') ---" >>"$ARCHIVO_LOG"

        inicio=$(date +%s.%N)

        # Usamos --wait para que Systemd NO deje avanzar el script hasta que el servicio esté totalmente parado
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
    hyprctl dispatch 'hl.dsp.exit()'
fi
if [[ "$1" == "lock" ]]; then
    if command -v playerctl >/dev/null 2>&1; then playerctl -a pause; fi
    hyprlock
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
