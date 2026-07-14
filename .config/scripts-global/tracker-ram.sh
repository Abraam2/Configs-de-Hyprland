#!/bin/bash

# --- CONFIGURACIÓN ---
LOG_FILE="$HOME/registro_ram.log"
# Lista de apps "buscadas" para vigilar (separa con espacios, usa nombres del proceso)
APPS_BUSCADAS=("qbittorrent-nox")
# Límite en Megabytes para saltar el aviso (ejemplo: 2048 MB = 2GB)
LIMITE_MB=800

# Función para pillar los datos y registrar
registrar_consumo() {
    echo "==================================================" >>"$LOG_FILE"
    echo "FECHA: $(date '+%Y-%m-%d %H:%M:%S') - MOMENTO: $1" >>"$LOG_FILE"
    echo "==================================================" >>"$LOG_FILE"
    echo "TOP 10 CONSUMO RAM:" >>"$LOG_FILE"

    # Pillamos el TOP 10 (PID, % MEM, MEM en MB, Comando)
    ps axo pid,%mem,rss,comm --sort=-rss | head -n 11 | tail -n +2 | while read -r pid mem rss comm; do
        # Convertimos RSS (kilobytes) a Megabytes
        mem_mb=$((rss / 1024))

        # Comprobamos si la app está en la lista de buscadas
        es_buscada=false
        for app in "${APPS_BUSCADAS[@]}"; do
            if [[ "$comm" == *"$app"* ]]; then
                es_buscada=true
                break
            fi
        done

        # Formateamos la línea
        linea="[PID: $pid] $comm - $mem_mb MB ($mem% RAM)"

        if [ "$es_buscada" = true ]; then
            if [ "$mem_mb" -gt "$LIMITE_MB" ]; then
                # Si supera el límite, metemos el WARN gordo y mandamos notificación al escritorio
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
# 1. Al arrancar
registrar_consumo "Arranque del sistema"

# 2. A los 5 minutos (300 segundos)
sleep 300
registrar_consumo "5 minutos después del arranque"

# 3. A los 15 minutos más (para llegar al minuto 20 en total)
sleep 900
registrar_consumo "20 minutos después del arranque"
