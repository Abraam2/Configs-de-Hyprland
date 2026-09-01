# El wifi se va de la nada

Hipótesis 1: PowerSave

- Ver si está activo:
  iw dev wlan0 get power_save

- Editar la conf:
  sudo nano /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf

```
[connection]
wifi.powersave = 2
```

- Aplicar cambios
  sudo systemctl restart NetworkManager

## Actualización, no es el puto power save

1. Ver el estado de la tabla ARP (si el PC sigue sabiendo quién es el router)

ip neigh show
Si la IP del router sale como FAILED o INCOMPLETE, el PC ha perdido la comunicación básica a nivel de enlace.

2. Ver si el chip o el driver de la tarjeta wifi se ha quedado frito en el kernel

sudo dmesg -T | grep -iE 'wlan|iwlwifi|ath9k|rtw|mt76|cfg80211|deauth|disassoc' | tail -n 25

Esto muestra si el chip wifi tiró errores internos, si el router te echó de la red (deauthenticated) o si hubo caídas de señal.

3. Ver el modelo exacto de tu tarjeta wifi y qué módulo/driver usa

lspci -k | grep -A 3 -i network

(O si es por USB):

lsusb

4. Ver el registro de eventos recientes de NetworkManager

journalctl -u NetworkManager -b --no-pager -n 35

5. Ver el estado detallado de la conexión Wi-Fi según NetworkManager

nmcli device status
nmcli -p device show wlan0

### Configurar SSH en keepass

Añadir en la conf de ssh de keepass

/run/user/1000/ssh-agent.socket

cd ~/.mydots
git init
git remote remove origin 2>/dev/null
git remote add origin git@github.com:Abraam2/Configs-de-Hyprland
git branch -M main

git config --global user.name "Abraam2"
git config --global user.email "dragonamarillo25@gmail.com"

### Cambiar aplicaciones predeterminadas del sistema

## Explorador de archivos

xdg-mime default nemo.desktop inode/directory
xdg-mime default nemo.desktop x-scheme-handler/file

## Visor de imágenes

for type in jpeg png webp gif bmp tiff x-avif; do xdg-mime default org.gnome.Loupe.desktop image/$type; done

xdg-mime query default image/jpeg

### Que vaya el brillo en el monitor

sudo modprobe i2c-dev

echo "i2c-dev" | sudo tee /etc/modules-load.d/i2c_dev.conf

sudo usermod -aG i2c $USER

### Hacer que VLC se abra bien

Abrir VLC, pulsar Ctrl+P para ir a los ajustes y desmarcar:

- Ajustar la interfaz al tamaño del vídeo

### Set up Ollama

- Instalar programa y habilitar servicio
  sudo pacman -S ollama-rocm

sudo systemctl enable --now ollama

- Verificar que está detectando la GPU y no la CPU)
  journalctl -u ollama.service -e

- Instalar modelo, dependiendo de las specs del PC, hay que elegir uno u otro
  ollama run qwen2.5-coder:14b

### Descargas de Jdownloader bloqueadas por CloudFlare

[Post de reddit con vídeo (Windows)](https://www.reddit.com/r/PiratedGames/comments/1u6ihck/cloudfare_siteprotection_bypass_tutorial/)
Arch (No funciona porque me cago en la puta madre)

### No va el putísimo virtualbox

sudo modprobe vboxdrv

sudo pacman -S virtualbox-host-dkms

REINICIAR

### El puto sddm greater aparece de la puta nada

sudo visudo

Abajo del todo del archivo añadir:
abraham ALL=(ALL) NOPASSWD: /home/abraham/scripts-global/tracker-ram.sh

### Nemo no puede abrir terminal

gsettings set org.cinnamon.desktop.default-applications.terminal exec 'kitty'

### Servicio Torrent diferente a qbitorrent-nox (experimental)

mkdir -p ~/.config/systemd/user

nano ~/.config/systemd/user/transmission.service

```toml
[Unit]
Description=Transmission BitTorrent Daemon
After=network.target

[Service]
Type=notify
ExecStart=/usr/bin/transmission-daemon -f --log-error
ExecReload=/bin/kill -s HUP $MAINPID

[Install]
WantedBy=default.target
```

systemctl --user daemon-reload
systemctl --user enable --now transmission
