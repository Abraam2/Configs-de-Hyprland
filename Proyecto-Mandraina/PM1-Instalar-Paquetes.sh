#!/bin/bash

# ==============================================================================
# PROYECTO MANDRIANA - (NIRI ENVIRONMENT)
# ==============================================================================

VERDE="\e[32m"
AZUL="\e[34m"
AMARILLO="\e[33m"
RESET="\e[0m"

echo -e "${AZUL}==================================================${RESET}"
echo -e "${VERDE}    Iniciando la instalación del Proyecto Mandriana${RESET}"
echo -e "${AZUL}==================================================${RESET}"

# --- PREGUNTA CONTROL DE ENTORNO (PORTÁTIL VS PC) ---
echo -e "\n${AMARILLO}¿Estás instalando esto en tu PC de escritorio? (s/n)${RESET}"
read -r respuesta

ES_ESCRITORIO=false
if [[ "$respuesta" =~ ^[Ss]$ ]]; then
    ES_ESCRITORIO=true
    echo -e "${VERDE}[+] Modo PC de escritorio activado (Se incluirá la Zona Gaming).${RESET}"
else
    echo -e "${AMARILLO}[-] Modo Portátil activado (Se omitirá la Zona Gaming).${RESET}"
fi

# ==============================================================================
# AUTO-INSTALACIÓN DE YAY
# ==============================================================================
if ! command -v yay &>/dev/null; then
    echo -e "\n${AMARILLO}[*] 'yay' no detectado. Instalando dependencias base y yay-bin...${RESET}"
    sudo pacman -S --needed --noconfirm base-devel git

    _tmp_dir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay-bin.git "$_tmp_dir"
    cd "$_tmp_dir" || exit 1
    makepkg -si --noconfirm
    cd - &>/dev/null || exit 1
    rm -rf "$_tmp_dir"

    echo -e "${VERDE}[+] 'yay' instalado correctamente.${RESET}"
fi

# ==============================================================================
# CATEGORÍA 1: ENTORNO GRÁFICO Y APPS (Escritorio, UI y Utilidades visuales)
# ==============================================================================
GRAFICAS_Y_APPS=(
    # Core Niri & Composición
    niri
    waypaper
    quickshell-git
    nwg-displays
    xsettingsd
    uwsm

    # Interfaz, Barras y Lanzadores
    waybar-git
    rofi
    swaync
    wlogout

    # Audio, Red, Energía y Dispositivos
    pavucontrol
    network-manager-applet
    nm-connection-editor
    power-profiles-daemon
    blueman
    udiskie

    # Gestores de Archivos y Visores
    nemo
    nemo-fileroller
    loupe
    gvfs-mtp
    ark

    # Capturas, Edición y Estética Gráfica
    satty
    grim
    slurp
    grimblast-git
    wayfreeze-git
    hyprpicker
    hyprsunset
    hyprsysteminfo
    hyprshutdown
    imagemagick
    gnome-themes-extra
    catppuccin-gtk-theme-mocha
    nwg-look
    qt5ct
    qt6ct

    # Aplicaciones Diarias
    helium-browser-bin
    gimp
    vlc
    libreoffice-fresh
    brave-bin
    floorp
    telegram-desktop
    visual-studio-code-bin
    jdownloader2
    keepassxc
    virtualbox
    timeshift
    # Me pesa el pito y añado esto
    nushell
    lazygit
    duf
    rsync
    obs-studio

)

# ==============================================================================
# CATEGORÍA 2: TERMINAL Y SISTEMA (Shells, CLI, Fuentes, Demonios y Entorno)
# ==============================================================================
TERMINAL_Y_SISTEMA=(
    # Shells, Multiplexores y Editores
    fish
    ncdu
    zsh
    tmux
    neovim
    kitty
    alacritty

    # Herramientas de Terminal (TUI / CLI) - ¡Imprescindibles!
    btop
    fastfetch
    ouch
    bat
    ripgrep
    fd
    fzf
    zoxide
    lazygit
    trash-cli
    cliphist
    wl-clipboard
    matugen
    playerctl
    brightnessctl
    pacman-contrib
    awww
    tesseract-data-eng
    ripdrag-git
    pokemon-colorscripts-git

    # Utilidades de bajo nivel de tu lista
    gpk-bin
    nirimod-git
    better-control-git
    wlrctl
    libnotify

    # Entorno e Intérpretes Python / Soporte
    polkit-gnome
    hypridle
    python-pip
    python-pipx
    python-gobject
    python-screeninfo
    python-pywalfox

    # Soporte de Capas Qt/Wayland para la UI
    qt5-wayland
    qt6-wayland
    qt6-svg
    qt6-virtualkeyboard
    qt6-multimedia-ffmpeg

    # Fuentes y Tipografías
    ttf-jetbrains-mono-nerd
    ttf-firacode-nerd
    ttf-meslo-nerd
    otf-font-awesome
    awesome-terminal-fonts
)

# ==============================================================================
# CATEGORÍA 3: ZONA GAMING (Solo Escritorio - Sin rastro de flatpaks individuales)
# ==============================================================================
ZONA_GAMING=(
    steam
    flatpak
    mangohud
    faugus-launcher
    goverlay
    gamemode
    wine-cachyos
    protontricks
    protonup-qt
    eden-preview-bin
    bb_launcher
)

# ==============================================================================
# PROCESAR INSTALACIÓN
# ==============================================================================

echo -e "\n${AZUL}[*] Instalando Categoría 1: Entorno Gráfico y Apps...${RESET}"
yay -S --needed --noconfirm "${GRAFICAS_Y_APPS[@]}"

echo -e "\n${AZUL}[*] Instalando Categoría 2: Terminal y Sistema...${RESET}"
yay -S --needed --noconfirm "${TERMINAL_Y_SISTEMA[@]}"

# Instalación condicional de la Zona Gaming
if [ "$ES_ESCRITORIO" = true ]; then
    echo -e "\n${AZUL}[*] Instalando Categoría 3: Zona Gaming...${RESET}"
    yay -S --needed --noconfirm "${ZONA_GAMING[@]}"
fi

echo -e "\n${VERDE}==================================================${RESET}"
echo -e "${VERDE}    ¡Fase 1 del Proyecto Mandriana Completada!     ${RESET}"
echo -e "${VERDE}==================================================${RESET}"
