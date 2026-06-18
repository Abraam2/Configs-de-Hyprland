#!/usr/bin/env bash
#    ___                    
#   / _ \___ _    _____ ____
#  / ___/ _ \ |/|/ / -_) __/
# /_/   \___/__,__/\__/_/   
#                           

terminate_clients() {
    # Obtenemos todos los PIDs de golpe
    client_pids=$(hyprctl clients -j | jq -r '.[] | .pid')

    if [ -n "$client_pids" ]; then
        echo ":: Cerrando aplicaciones..."
        # Enviamos SIGTERM a todas a la vez, sin esperar de una en una
        echo "$client_pids" | xargs kill -15 2>/dev/null
        
        # Un pequeño segundo de cortesía global para que guarden datos
        sleep 1
    fi

    # ARREGLADO: Arriba iba con MAYÚSCULAS ($HOME)
    if [ -f "$HOME/.config/ml4w/listeners.sh" ]; then
        bash "$HOME/.config/ml4w/listeners.sh" --stopall
    fi
}

if [[ "$1" == "exit" ]]; then
    echo ":: Exit"
    terminate_clients
    hyprctl dispatch 'hl.dsp.exit()'
fi

if [[ "$1" == "lock" ]]; then
    echo ":: Lock"
    if command -v playerctl >/dev/null 2>&1; then
        playerctl -a pause
    fi
    hyprlock
fi

if [[ "$1" == "reboot" ]]; then
    echo ":: Reboot"
    terminate_clients
    systemctl reboot
fi

if [[ "$1" == "shutdown" ]]; then
    echo ":: Shutdown"
    terminate_clients
    systemctl poweroff
fi

if [[ "$1" == "suspend" ]]; then
    echo ":: Suspend"
    sleep 0.2
    systemctl suspend
fi

if [[ "$1" == "hibernate" ]]; then
    echo ":: Hibernate"
    sleep 0.2
    systemctl hibernate
fi