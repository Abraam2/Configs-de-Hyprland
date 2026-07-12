# -----------------------------------------------------
# GENERAL
# -----------------------------------------------------
alias c='clear'
alias nf='fastfetch'
alias pf='fastfetch'
alias ff='fastfetch'
alias bum='systemctl poweroff'
alias shutdown='systemctl poweroff'

# -----------------------------------------------------
# Random
# -----------------------------------------------------
alias suso='sudo'
alias +x='chmod +x'
alias clear-links='find . -type l ! -exec test -e {} \; -delete'

# -----------------------------------------------------
# Pacman y cachy
# -----------------------------------------------------

alias niri-apps-id='niri msg -j windows | jq -r \'.[] | "\(.title) -> \(.app_id)"\''
alias niri-select-app-id="niri msg pick-window"

# -----------------------------------------------------
# Pacman y cachy
# -----------------------------------------------------

# Actualizar el sistema por completo
alias pac-update="sudo pacman -Syu"

# Buscar un paquete en los repositorios usando palabras clave
# (Reemplaza el típico 'pacman -Ss')
alias pac-find="pacman -Ss"

# Buscar un paquete que YA tienes instalado en tu sistema
alias pac-find-local="pacman -Qs"

# Ver toda la información detallada de un paquete específico
alias pac-info="pacman -Si"

# Ver los archivos que contiene un paquete instalado
alias pac-files="pacman -Ql"

# Ver paquetes instalados
# (Muestra todos, para filtrar con grep tete)
alias pac-pak='pacman -Q'

# Limpiar el caché de paquetes descargados para recuperar espacio
# (Borra los paquetes antiguos guardados, dejando solo los últimos instalados)
alias pac-cache="sudo pacman -Sc"

# Eliminar paquetes "huérfanos" (dependencias que se quedaron colgadas y ya ningún programa usa)
alias pac-clean="sudo pacman -Rns (pacman -Qtdq)"

# Actualizar y ordenar los mirrors de CachyOS por velocidad
# (Usa la herramienta propia de CachyOS para ratear sus repositorios)
alias mirrors="sudo cachyos-rate-mirrors"
alias update-mirrors="sudo cachyos-rate-mirrors"

# Actualizar los mirrors generales de Arch Linux usando reflector (optimizado por velocidad/país)
alias arch-mirrors="sudo reflector --protocol https --latest 20 --sort rate --save /etc/pacman.d/mirrorlist"

# -----------------------------------------------------
# ARCHIVOS Y NAVEGACIÓN
# -----------------------------------------------------
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -v'
alias mkdir='mkdir -p'
alias f='finder'
alias u='yay -Rns'
alias i='yay -S'
alias ..='z ..'
alias ...='z ../..'

function nvim
    if isatty stdin
        # Si abres Neovim normal, lanza tu script de Kitty
        nv $argv
    else
        # Si detecta un pipe (ej. ls | nvim), usa el Neovim de verdad en la propia terminal
        command nvim $argv
    end
end

# Para mantener la comodidad de la letra 'n':
function n
    nvim $argv
end
# 2. Sobrescribe z para que haga cd y luego ls
function z
    __zoxide_z $argv
    ls
end

# -----------------------------------------------------
# HERRAMIENTAS MODERNAS
# -----------------------------------------------------
#alias ls='eza -a --icons=always --group-directories-first -I ".vboxclient*"'
alias ls='eza -a --icons=always --group-directories-first'
alias ll='eza -alh --icons=always --group-directories-first'
alias lt='eza -a --tree --level=1 --icons=always'
alias bat='bat --style=grid,header --paging=never'
alias cat='bat --style=grid,header --paging=never'
alias batn='bat'
alias catn='bat'
alias grep='rg'
alias df='duf'
alias du='dust'
alias top='btop'
alias htop='btop'
alias disco='ncdu'
alias man='tldr'

alias gs="git status"
alias lg="lazygit"
alias ga="git add ."
alias gcm="git commit -m"
alias gc="git clone"
alias gC="git clone"
alias gp="git push"
alias gpl="git pull"
alias gst="git stash"
alias gsp="git stash; git pull"
alias gfo="git fetch origin"
alias gcheck="git checkout"
alias gcredential="git config credential.helper store"
