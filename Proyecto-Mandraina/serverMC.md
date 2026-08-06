### Crear server de Maincra

## Docker

# Archivo docker-compose.yml

```yml
services:
  mc:
    image: itzg/minecraft-server
    container_name: mc
    ports:
      - "25565:25565"
    environment:
      EULA: "TRUE"
      TYPE: "FABRIC"
      VERSION: "1.21.11"
      MEMORY: "10G"
      MOTD: "La Tercera Vaca"
    volumes:
      - ./datos_server:/data
    tty: true
    stdin_open: true
```

# Instalación y permisos varios

sudo pacman -S docker docker-compose
sudo systemctl enable --now docker

sudo usermod -aG docker $USER

(Logout para que vaya joya)

docker-compose up -d

# Para conectar a un pana

curl -fsSL https://tailscale.com/install.sh | sh
