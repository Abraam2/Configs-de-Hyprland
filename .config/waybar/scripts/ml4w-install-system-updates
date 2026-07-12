#!/usr/bin/env bash

# Check if command exists
_checkCommandExists() {
    cmd="$1"
    if ! command -v "$cmd" >/dev/null; then
        echo 1
        return
    fi
    echo 0
}

_isInstalled() {
    package="$1"
    case $install_platform in
        arch)
            check="$($aur_helper -Qs --color always "${package}" | grep "local" | grep "${package} ")"
            ;;
        fedora)
            check="$(dnf repoquery --quiet --installed ""${package}*"")"
            ;;
        *) ;;
    esac

    if [ -n "${check}" ]; then
        echo 0 
        return 
    fi
    echo 1 
    return 
}

# ------------------------------------------------------
# Confirm Start (SALTADO)
# ------------------------------------------------------
clear
figlet -f smslant "Updates"
echo ":: Iniciando actualización automática..."

# ----------------------------------------------------- 
# Install update
# ----------------------------------------------------- 

# Arch Linux
if [[ $(_checkCommandExists "pacman") == 0 ]]; then
    if [[ $(_checkCommandExists "yay") == 0 ]]; then
        # Actualiza todo (incluido AUR) sin preguntar
        yay -Syu --noconfirm
    elif [[ $(_checkCommandExists "paru") == 0 ]]; then
        # Actualiza todo (incluido AUR) sin preguntar
        paru -Syu --noconfirm
    else
        # Si no hay helper, usa pacman (necesitará sudo)
        sudo pacman -Syu --noconfirm
    fi

# Fedora
elif [[ $(_checkCommandExists "dnf") == 0 ]]; then
    # -y acepta todo automáticamente
    sudo dnf upgrade -y
else
    echo ":: ERROR - Plataforma no soportada"
    exit 1
fi

# Flatpak
if [[ $(_checkCommandExists "flatpak") == 0 ]]; then
    echo ":: Buscando actualizaciones de Flatpak..."
    # -y para no confirmar
    flatpak update -y
fi

# Reload Waybar
pkill -RTMIN+1 waybar

# Guardar la fecha del último éxito
mkdir -p ~/.cache/ml4w
date +"%A, %d de %B" | sed 's/./\U&/' > ~/.cache/ml4w/last_update.txt

# Notificación visual
if [[ $(_checkCommandExists "notify-send") == 0 ]]; then
    notify-send -i software-update-available "Actualización completada" "Tu sistema se ha actualizado correctamente."
fi

echo ":: ¡Todo listo! El sistema está al día."
# Quitamos el 'read' final para que la terminal se cierre sola o termine el proceso.