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
