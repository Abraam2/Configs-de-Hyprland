# -----------------------------------------------------
# 1. EL MOTOR (PATH y Entorno) - ¡ESTO VA PRIMERO!
# -----------------------------------------------------
export EDITOR='nvim'
typeset -U path PATH
path=(
  /usr/lib/ccache/bin
  $HOME/.cargo/bin
  $HOME/.local/bin
  $path
)
export PATH

# Inicializar herramientas básicas (Para que 'z' y 'fzf' funcionen)
[[ -x $(command -v zoxide) ]] && eval "$(zoxide init zsh)"
[[ -x $(command -v fzf) ]] && source <(fzf --zsh)

# -----------------------------------------------------
# 2. ZIM FRAMEWORK (Plugins y Syntax)
# -----------------------------------------------------
ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init
fi
source ${ZIM_HOME}/init.zsh

# -----------------------------------------------------
# 3. CONFIGURACIÓN DE ZSH
# -----------------------------------------------------
setopt HIST_IGNORE_ALL_DUPS
setopt CORRECT
bindkey -e
WORDCHARS=${WORDCHARS//[\/]}
SPROMPT='¿Quisiste decir %F{green}%r%f? (y/n): '

zstyle ':zim:input' double-dot-expand yes
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# -----------------------------------------------------
# 4. EL CARGADOR INTELIGENTE (Carga tus carpetas)
# -----------------------------------------------------
load_configs() {
    local dir="$1"
    [ ! -d "$dir" ] && return
    
    # Cargamos archivos, pero ignoramos carpetas de binarios/scripts para que no se abra el finder solo
    for f in "$dir"/**/*(N-.); do
        # SALTAR si el archivo es un binario, un script o ya se cargó (init)
        [[ "$f" == *"/basura/"* || "$f" == *"/scripts/"* || "$f" == *"init"* ]] && continue
        
        # Lógica de ML4W: priorizar carpeta 'custom'
        local c="${f//.config\/zshrc/.config\/zshrc\/custom}"
        if [[ -f "$c" && "$f" != "$c" ]]; then
            source "$c"
        else
            source "$f"
        fi
    done
}

load_configs ~/.config/zshrc
load_configs ~/.config/zsh/conf.d

# -----------------------------------------------------
# 5. PARCHE PARA EL ALIAS 'Z' (Estilo Fish)
# -----------------------------------------------------
# Esto tiene que estar DESPUÉS de cargar los alias para sobrescribir el 'z' de zoxide
z() {
  if [ "$#" -eq 0 ]; then
    __zoxide_z
  else
    __zoxide_z "$@"
  fi
  if [ $? -eq 0 ]; then
    eza -a --icons=always --group-directories-first
  fi
}


