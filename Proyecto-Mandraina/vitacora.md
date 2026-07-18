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

### Que el sistema detecte el explorador por defecto preferido

xdg-mime default nemo.desktop inode/directory
xdg-mime default nemo.desktop x-scheme-handler/file

### Que vaya el brillo en el monitor

sudo modprobe i2c-dev

echo "i2c-dev" | sudo tee /etc/modules-load.d/i2c_dev.conf

sudo usermod -aG i2c $USER
