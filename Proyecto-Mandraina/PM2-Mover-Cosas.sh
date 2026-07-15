#!/bin/bash

# ==============================================================================
# PROYECTO MANDRIANA - FASE 1.5 & 2: DESPLIEGUE DE ENLACES SIMBÓLICOS
# ==============================================================================

VERDE="\e[32m"
AZUL="\e[34m"
AMARILLO="\e[33m"
RESET="\e[0m"

echo -e "${AZUL}==================================================${RESET}"
echo -e "${VERDE}    Desplegando Configuraciones - Proyecto Mandriana${RESET}"
echo -e "${AZUL}==================================================${RESET}"

# Directorio actual donde has ejecutado el script
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_MYDOTS="$HOME/.mydots"

# Asegurar directorios base esenciales del sistema
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.local/share/applications"

# --- COMPROBACIÓN Y AUTO-MUDANZA A ~/.mydots ---
if [ "$CURRENT_DIR" != "$TARGET_MYDOTS" ]; then
    echo -e "\n${AMARILLO}[!] Detectado: No estás ejecutando el script desde $TARGET_MYDOTS${RESET}"
    echo -e "[*] Creando la carpeta central de dotfiles en $TARGET_MYDOTS..."
    mkdir -p "$TARGET_MYDOTS"

    echo -e "[*] Copiando todos los archivos de configuración a $TARGET_MYDOTS..."
    # Copia todo el contenido (incluyendo archivos ocultos) a ~/.mydots
    cp -r "$CURRENT_DIR"/. "$TARGET_MYDOTS/"

    # Cambiamos nuestra variable de origen para que a partir de ahora enlace desde ~/.mydots
    DOTFILES_DIR="$TARGET_MYDOTS"
    echo -e "${VERDE}[+] Mudanza completada. Los enlaces se crearán apuntando a $TARGET_MYDOTS${RESET}"
else
    DOTFILES_DIR="$CURRENT_DIR"
    echo -e "${VERDE}[+] Ejecutando directamente desde la carpeta de confianza: $TARGET_MYDOTS${RESET}"
fi

# --- FASE 1.5: MOVER Y COPIAR ARCHIVOS ESPECÍFICOS ---

# 1. Copiar carpeta de Fondos a ~/
if [ -d "$DOTFILES_DIR/Fondos" ]; then
    if [ ! -d "$HOME/Fondos" ]; then
        echo -e "[*] Copiando carpeta Fondos a $HOME/..."
        cp -r "$DOTFILES_DIR/Fondos" "$HOME/"
    else
        echo -e "${AMARILLO}[!] La carpeta ~/Fondos ya existe. Saltando para evitar sobreescribir.${RESET}"
    fi
else
    echo -e "${AMARILLO}[!] No se encontró la carpeta $DOTFILES_DIR/Fondos.${RESET}"
fi

# 2. Mover nvim.desktop a ~/.local/share/applications/
if [ -f "$DOTFILES_DIR/Misc/nvim.desktop" ]; then
    echo -e "[*] Colocando nvim.desktop en las aplicaciones del sistema..."
    cp "$DOTFILES_DIR/Misc/nvim.desktop" "$HOME/.local/share/applications/nvim.desktop"
else
    echo -e "${AMARILLO}[!] No se encontró $DOTFILES_DIR/Misc/nvim.desktop. Comprueba si la ruta es correcta.${RESET}"
fi

# --- FASE 2: GESTIÓN DE ENLACES SIMBÓLICOS (Mydots / Configs) ---

# Función inteligente para enlazar archivos/carpetas evitando romper cosas existentes
crear_enlace() {
    local origen="$1"
    local destino="$2"

    # Si ya existe algo en el destino (y no es un enlace simbólico ya hecho)
    if [ -e "$destino" ] || [ -L "$destino" ]; then
        if [ -L "$destino" ] && [ "$(readlink "$destino")" == "$origen" ]; then
            echo -e "${VERDE}[+] Ya enlazado correctamente: $(basename "$destino")${RESET}"
            return
        fi
        echo -e "${AMARILLO}[!] El destino $destino ya existe. Creando copia de seguridad (.bak)...${RESET}"
        mv "$destino" "${destino}.bak"
    fi

    # Crear el enlace simbólico
    ln -s "$origen" "$destino"
    echo -e "${VERDE}[+] Enlace creado: $(basename "$destino") -> $origen${RESET}"
}

# 1. Elementos que van directos a la RAÍZ de tu $HOME
declare -A COSAS_HOME=(
    ["scripts-global"]="$HOME/scripts-global"
    ["Info_Random"]="$HOME/Info_Random"
    ["VariosXD"]="$HOME/VariosXD"
)

echo -e "\n${AZUL}[*] Enlazando configs de la raíz ($HOME)...${RESET}"
for origen in "${!COSAS_HOME[@]}"; do
    if [ -e "$DOTFILES_DIR/$origen" ]; then
        crear_enlace "$DOTFILES_DIR/$origen" "${COSAS_HOME[$origen]}"
    fi
done

# 2. Elementos que van dentro de ~/.config/
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

echo -e "\n${AZUL}[*] Enlazando carpetas de aplicaciones en ~/.config/...${RESET}"
for app in "${CONFIG_APPS[@]}"; do
    if [ -e "$DOTFILES_DIR/$app" ]; then
        crear_enlace "$DOTFILES_DIR/$app" "$HOME/.config/$app"
    else
        echo -e "${AMARILLO}[!] Alerta: Tienes configurado '$app' pero no existe la carpeta en tu repositorio.${RESET}"
    fi
done

echo -e "\n${VERDE}==================================================${RESET}"
echo -e "${VERDE}    ¡Instalación y enlaces completados con éxito! ${RESET}"
echo -e "${VERDE}==================================================${RESET}"
