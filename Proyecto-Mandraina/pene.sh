#!/bin/bash

VERDE="\e[32m"
AZUL="\e[34m"
RESET="\e[0m"

echo -e "${AZUL}==================================================${RESET}"
echo -e "${VERDE}    Preparando Entorno y Restaurando con Chezmoi   ${RESET}"
echo -e "${AZUL}==================================================${RESET}"

# 1. Asegurar que chezmoi está instalado
if ! command -v chezmoi &>/dev/null; then
    sudo pacman -S --needed --noconfirm chezmoi
fi

# 2. Descargar tu copia de seguridad de Git sin aplicarla todavía
echo -e "[*] Descargando tus configuraciones profundas..."
# Reemplaza con la URL de tu repositorio privado
chezmoi init https://github.com/tu-usuario/tu-repo-privado-chezmoi.git

# 3. EL ANTIDOTO ANTIPETADAS: Crear directorios reales que falten
echo -e "[*] Asegurando la estructura de directorios en el nuevo sistema..."
mkdir -p "$HOME/.config/BraveSoftware/Brave-Browser/User Data/Default"
mkdir -p "$HOME/.config/Helium"
mkdir -p "$HOME/.config/Code/User"
mkdir -p "$HOME/.config/keepassxc"
mkdir -p "$HOME/.config/Cemu"
mkdir -p "$HOME/.config/eden"
mkdir -p "$HOME/.config/PCSX2"
mkdir -p "$HOME/.config/mangohud"
mkdir -p "$HOME/.config/yay"
mkdir -p "$HOME/.config/systemd/user"
mkdir -p "$HOME/.local/share/TelegramDesktop"
mkdir -p "$HOME/.local/share/PCSX2"
mkdir -p "$HOME/.local/share/fish"
mkdir -p "$HOME/.jd"
mkdir -p "$HOME/.ssh"

# Estructura para los Flatpaks por si no los has abierto todavía
mkdir -p "$HOME/.var/app/org.ppsspp.PPSSPP/config/ppsspp"
mkdir -p "$HOME/.var/app/org.libretro.RetroArch/config/retroarch"
mkdir -p "$HOME/.var/app/org.DolphinEmu.dolphin-emu/config/dolphin-emu"
mkdir -p "$HOME/.var/app/app.xemu.xemu/config/xemu"

# Carpetas del sistema (requieren sudo en el paso final, así que las preparamos)
sudo mkdir -p "/etc/systemd/system"
sudo mkdir -p "/etc/NetworkManager/system-connections"
sudo mkdir -p "/etc/udev/rules.d"

# 4. TRANCAZO FINAL: Desplegar todo en su sitio exacto
echo -e "\n${VERDE}[*] Lanzando chezmoi apply. Colocando cada config en su sitio...${RESET}"
chezmoi apply

echo -e "\n${VERDE}==================================================${RESET}"
echo -e "${VERDE}    ¡Fase 3 Completada! Sistema restaurado al 100% ${RESET}"
echo -e "${VERDE}==================================================${RESET}"
