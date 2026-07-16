#!/bin/bash

# ==============================================================================
# PROYECTO MANDRIANA - FASE 1.5 & 2: DESPLIEGUE DINÁMICO DE ENLACES SIMBÓLICOS
# ==============================================================================

VERDE="\e[32m"
AZUL="\e[34m"
AMARILLO="\e[33m"
RESET="\e[0m"

echo -e "${AZUL}==================================================${RESET}"
echo -e "${VERDE}    Desplegando Configuraciones - Proyecto Mandriana${RESET}"
echo -e "${AZUL}==================================================${RESET}"

# Directorio actual desde donde ejecutas el script
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_MYDOTS="$HOME/.mydots"

# Asegurar directorios base esenciales del sistema real
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.local/share/applications"

# --- COMPROBACIÓN Y AUTO-MUDANZA A ~/.mydots ---
if [ "$CURRENT_DIR" != "$TARGET_MYDOTS" ]; then
    echo -e "\n${AMARILLO}[!] Detectado: No estás ejecutando el script desde $TARGET_MYDOTS${RESET}"
    echo -e "[*] Creando la carpeta central en $TARGET_MYDOTS..."
    mkdir -p "$TARGET_MYDOTS"

    echo -e "[*] Moviendo todo el contenido de tu repositorio a $TARGET_MYDOTS..."
    # Copiamos todo de manera limpia incluyendo ocultos
    cp -r "$CURRENT_DIR"/. "$TARGET_MYDOTS/"

    DOTFILES_DIR="$TARGET_MYDOTS"
    echo -e "${VERDE}[+] Todo tu repo se ha mudado y centralizado en $TARGET_MYDOTS${RESET}"
else
    DOTFILES_DIR="$CURRENT_DIR"
    echo -e "${VERDE}[+] Ejecutando directamente desde $TARGET_MYDOTS${RESET}"
fi

# --- DETECCIÓN DINÁMICA DE LA CARPETA CONFIG ---
# Busca si en tu repo se llama .config o config
if [ -d "$DOTFILES_DIR/.config" ]; then
    CONFIG_ORIGEN_DIR="$DOTFILES_DIR/.config"
elif [ -d "$DOTFILES_DIR/config" ]; then
    CONFIG_ORIGEN_DIR="$DOTFILES_DIR/config"
else
    echo -e "${AMARILLO}[!] Alerta: No se encontró la carpeta 'config' o '.config' en tu repositorio.${RESET}"
    CONFIG_ORIGEN_DIR=""
fi

# --- FASE 1.5: MOVER Y COPIAR ARCHIVOS ESPECÍFICOS ---

# 1. Copiar carpeta de Fondos a ~/
if [ -d "$DOTFILES_DIR/Fondos" ]; then
    if [ ! -d "$HOME/Fondos" ]; then
        echo -e "[*] Copiando carpeta Fondos a $HOME/..."
        cp -r "$DOTFILES_DIR/Fondos" "$HOME/"
    else
        echo -e "${AMARILLO}[!] La carpeta ~/Fondos ya existe en tu sistema. No se sobrescribe.${RESET}"
    fi
else
    echo -e "${AMARILLO}[!] No se encontró la carpeta ./Fondos en los dotfiles.${RESET}"
fi

# 2. Copiar nvim.desktop desde tu carpeta Misc
if [ -f "$DOTFILES_DIR/Misc/nvim.desktop" ]; then
    echo -e "[*] Colocando nvim.desktop en las aplicaciones del sistema..."
    cp "$DOTFILES_DIR/Misc/nvim.desktop" "$HOME/.local/share/applications/nvim.desktop"
else
    echo -e "${AMARILLO}[!] No se encontró ./Misc/nvim.desktop.${RESET}"
fi

# --- FASE 2: GESTIÓN DE ENLACES SIMBÓLICOS (Mydots / Configs) ---

# Función para crear los enlaces de manera segura haciendo .bak si ya existen
crear_enlace() {
    local origen="$1"
    local destino="$2"

    if [ -e "$destino" ] || [ -L "$destino" ]; then
        if [ -L "$destino" ] && [ "$(readlink "$destino")" == "$origen" ]; then
            echo -e "${VERDE}[+] Ya enlazado correctamente: $(basename "$destino")${RESET}"
            return
        fi
        echo -e "${AMARILLO}[!] El destino $destino ya existe. Creando copia de seguridad (.bak)...${RESET}"
        mv "$destino" "${destino}.bak"
    fi

    ln -s "$origen" "$destino"
    echo -e "${VERDE}[+] Enlace creado: $(basename "$destino") -> $origen${RESET}"
}

# 1. Enlazar elementos que van directos a tu $HOME
# El script mirará primero dentro de tu carpeta "Home" si existe en el repo,
# si no, lo buscará en la raíz del mismo por si acaso.
declare -A COSAS_HOME=(
    ["scripts-global"]="$HOME/scripts-global"
    ["Info_Random"]="$HOME/Info_Random"
)

echo -e "\n${AZUL}[*] Enlazando carpetas personales de la raíz ($HOME)...${RESET}"
for clave in "${!COSAS_HOME[@]}"; do
    if [ -e "$DOTFILES_DIR/Home/$clave" ]; then
        crear_enlace "$DOTFILES_DIR/Home/$clave" "${COSAS_HOME[$clave]}"
    elif [ -e "$DOTFILES_DIR/$clave" ]; then
        crear_enlace "$DOTFILES_DIR/$clave" "${COSAS_HOME[$clave]}"
    fi
done

# 2. Enlazar aplicaciones de tu config real a ~/.config/
CONFIG_APPS=(
    autostart
    btop
    environment.d
    fastfetch
    fish
    kitty
    satty
    matugen
    niri
    nvim
    ohmyposh
    qt6ct
    quickshell
    rofi
    swaync
    tmux
    waybar
    waypaper
    wlogout
    yazi
    chromium-flags.conf
    edge-flags.conf
)

if [ -n "$CONFIG_ORIGEN_DIR" ]; then
    echo -e "\n${AZUL}[*] Enlazando carpetas de aplicaciones en ~/.config/ desde $CONFIG_ORIGEN_DIR/...${RESET}"
    for app in "${CONFIG_APPS[@]}"; do
        if [ -e "$CONFIG_ORIGEN_DIR/$app" ]; then
            crear_enlace "$CONFIG_ORIGEN_DIR/$app" "$HOME/.config/$app"
        else
            echo -e "${AMARILLO}[!] Alerta: Tienes configurado '$app' pero no existe en $CONFIG_ORIGEN_DIR/$app${RESET}"
        fi
    done
fi

echo -e "\n${VERDE}==================================================${RESET}"
echo -e "${VERDE}    ¡Instalación y enlaces completados con éxito!  ${RESET}"
echo -e "${VERDE}==================================================${RESET}"
