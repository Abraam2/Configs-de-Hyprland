#!/bin/bash

# Copia aquí exactamente las listas de tu script para comprobarlas
PAQUETES=(
    # --- CATEGORÍA 1 ---
    niri waypaper quickshell-git nwg-displays xsettingsd uwsm xwayland-satellite
    waybar-git rofi swaync wlogout pavucontrol spotify network-manager-applet
    nm-connection-editor power-profiles-daemon blueman udiskie nemo nemo-fileroller
    loupe gvfs-mtp ark satty grim slurp grimblast-git wayfreeze-git hyprpicker
    hyprsunset hyprsysteminfo hyprshutdown imagemagick gnome-themes-extra
    catppuccin-gtk-theme-mocha nwg-look qt5ct qt6ct helium-browser-bin brave-bin
    floorp gimp vlc obs-studio libreoffice-fresh telegram-desktop visual-studio-code-bin
    jdownloader2 keepassxc virtualbox timeshift

    # --- CATEGORÍA 2 ---
    fish zsh nushell tmux neovim kitty alacritty nodejs npm go rustup jdk21-openjdk
    btop fastfetch ouch bat ripgrep fd fzf zoxide lazygit duf ncdu rsync trash-cli
    cliphist wl-clipboard matugen playerctl brightnessctl pacman-contrib awww
    tesseract-data-eng ripdrag-git pokemon-colorscripts-git ghgrab-bin wev gpk-bin
    wlrctl nirimod-git better-control-git libnotify polkit-gnome hypridle python-pip
    python-pipx python-gobject python-screeninfo python-pywalfox xdg-desktop-portal-gnome
    xdg-desktop-portal-gtk qt5-wayland qt6-wayland qt6-svg qt6-virtualkeyboard
    qt6-multimedia-ffmpeg ttf-jetbrains-mono-nerd ttf-firacode-nerd ttf-meslo-nerd
    otf-font-awesome awesome-terminal-fonts

    # --- CATEGORÍA 3 ---
    steam flatpak mangohud faugus-launcher goverlay gamemode wine-cachyos
    protontricks protonup-qt eden-preview-bin bb_launcher
)

echo "Iniciando comprobación de paquetes..."
echo "------------------------------------"

FALTAN=0

for pkg in "${PAQUETES[@]}"; do
    # Comprobar si existe en repos oficiales o en AUR usando yay
    if ! yay -Si "$pkg" &>/dev/null; then
        echo -e "\e[31m[❌] NO ENCONTRADO: $pkg\e[0m"
        ((FALTAN++))
    else
        echo -e "\e[32m[✓] Encontrado: $pkg\e[0m"
    fi
done

echo "------------------------------------"
if [ $FALTAN -eq 0 ]; then
    echo -e "\e[32m¡Perfecto! Todos los paquetes de la lista existen y están listos para instalar.\e[0m"
else
    echo -e "\e[31mAtención: Se han encontrado $FALTAN paquetes que no existen o tienen el nombre mal escrito.\e[0m"
fi
