#!/bin/bash

# Obtenemos hora y minuto
hora=$(date +%H)
minuto=$(date +%M)

# Determinar AM/PM manualmente
if [ $hora -ge 12 ]; then
    periodo="pm"
else
    periodo="am"
fi

# Convertir a formato 12h
if [ $hora -eq 0 ]; then
    hora12=12
elif [ $hora -gt 12 ]; then
    hora12=$((hora - 12))
else
    # Quitamos el cero a la izquierda si lo tiene (opcional)
    hora12=$(echo $hora | sed 's/^0//')
    [ -z "$hora12" ] && hora12=0
fi

# Obtener fecha en español capitalizada (Lunes, 26 Febrero,)
fecha=$(LC_TIME=es_ES.UTF-8 date "+%A, %d %B," | sed 's/\b\(.\)/\u\1/g')

# El output que leerá Waybar
echo "󰅐  $fecha $hora12:$minuto $periodo"
