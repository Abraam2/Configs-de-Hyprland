#!/bin/bash

# --- CONFIGURACIÓN ---
LOG_FILE="$HOME/registro_ram.log"
# Corregido el nombre a "sddm-greeter" para que pille cualquier variante (qt, qt6, etc)
APPS_BUSCADAS=("qbittorrent-nox" "sddm-greeter")
LIMITE_MB=800

# Función para pillar los datos y registrar
registrar_consumo() {
    echo "==================================================" >>"$LOG_FILE"
    echo "FECHA: $(date '+%Y-%m-%d %H:%M:%S') - MOMENTO: $1" >>"$LOG_FILE"
    echo "==================================================" >>"$LOG_FILE"
    echo "TOP 10 CONSUMO RAM:" >>"$LOG_FILE"

    ps axo pid,%mem,rss,comm --sort=-rss | head -n 11 | tail -n +2 | while read -r pid mem rss comm; do
        mem_mb=$((rss / 1024))
        es_buscada=false

        for app in "${APPS_BUSCADAS[@]}"; do
            if [[ "$comm" == *"$app"* ]]; then
                es_buscada=true
                break
            fi
        done

        # --- ZONA DEL FRANCOTIRADOR ---
        if [[ "$comm" == *"sddm-greeter"* ]]; then
            # Lo matamos sin piedad y lo registramos
            sudo kill -9 "$pid" 2>/dev/null
            echo "[💀 FULMINADO] El camino del hombre recto está por todos lados rodeado por la avaricia de los egoístas y la tiranía de los hombres malos.$comm (PID: $pid)" >>"$LOG_FILE"
            continue # Saltamos al siguiente proceso para no registrarlo abajo
        fi
        # ------------------------------

        linea="[PID: $pid] $comm - $mem_mb MB ($mem% RAM)"

        if [ "$es_buscada" = true ]; then
            if [ "$mem_mb" -gt "$LIMITE_MB" ]; then
                echo "[⚠️ ALERTA EXCESO] $linea" >>"$LOG_FILE"
                notify-send "¡Alerta de RAM!" "La app '$comm' está usando $mem_mb MB" --urgency=critical
            else
                echo "[WARN - Vigilada] $linea" >>"$LOG_FILE"
            fi
        else
            echo "  $linea" >>"$LOG_FILE"
        fi
    done
    echo -e "\n" >>"$LOG_FILE"
}

# --- FLUJO DE TIEMPOS ---
registrar_consumo "Arranque del sistema"
sleep 300
registrar_consumo "5 minutos después del arranque"
sleep 900
registrar_consumo "20 minutos después del arranque"
