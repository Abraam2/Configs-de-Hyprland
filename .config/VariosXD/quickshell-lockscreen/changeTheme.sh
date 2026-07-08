#!/usr/bin/env bash

# ==========================================
# 1. TUS RUTAS REALES (CÁMBIALAS POR LAS DE TUS DOTFILES)
# ==========================================
# Dónde están tus temas guardados
THEMES_DIR="$HOME/.mydotfiles/com.ml4w.dotfiles/.config/VariosXD/quickshell-lockscreen/themes/"
# Dónde está tu script de bloqueo principal
LOCK_SCRIPT="$HOME/.local/share/quickshell-lockscreen/lock.sh"

# ==========================================

# Utilidades de color
C_MAIN='\033[38;2;202;169;224m'
C_ACCENT='\033[38;2;145;177;240m'
C_DIM='\033[38;2;129;122;150m'
C_GREEN='\033[38;2;166;209;137m'
C_YELLOW='\033[38;2;229;200;144m'
C_RED='\033[38;2;231;130;132m'
C_BOLD='\033[1m'
C_RESET='\033[0m'
trap 'echo -ne "\033[0m"' EXIT

info() { echo -e "${C_MAIN}${C_BOLD} ╭─ 󰓅 $1${C_RESET}"; }
substep() { echo -e "${C_MAIN}${C_BOLD} │  ${C_DIM}❯ ${C_RESET}$1"; }
success() { echo -e "${C_MAIN}${C_BOLD} ╰─ ${C_GREEN}✔ ${C_RESET}$1\n"; }
error() { echo -e "${C_MAIN}${C_BOLD} ╰─ ${C_RED}✘ ${C_RESET}$1\n"; }

clear
echo -e "${C_MAIN}${C_BOLD}"
echo " ╭──────────────────────────────────────────╮"
echo " │       SELECTOR DE TEMAS QYLOCK           │"
echo " ╰──────────────────────────────────────────╯"
echo -e "${C_RESET}"

info "Seleccionando tema del Lockscreen..."

# Selección con FZF o manual
if ! command -v fzf &>/dev/null; then
    THEMES=($(ls -1 "$THEMES_DIR"))
    for i in "${!THEMES[@]}"; do
        echo -e "${C_MAIN}${C_BOLD} │  ${C_ACCENT}$((i + 1)) ${C_DIM}❯ ${C_RESET}${THEMES[$i]}"
    done
    echo -ne "${C_MAIN}${C_BOLD} ╰─ ${C_YELLOW}Choice: ${C_RESET}"
    read -rp "" SELECTION
    if [[ "$SELECTION" =~ ^[0-9]+$ ]] && [ "$SELECTION" -ge 1 ] && [ "$SELECTION" -le "${#THEMES[@]}" ]; then
        THEME_NAME="${THEMES[$((SELECTION - 1))]}"
    else
        error "Selección inválida. Defaulting to 'nier-automata'."
        THEME_NAME="nier-automata"
    fi
else
    THEME_NAME=$(ls -1 "$THEMES_DIR" | fzf --prompt="Select theme: " --height=15 --reverse --border)
    if [ -z "$THEME_NAME" ]; then
        error "Nada seleccionado. Defaulting to 'nier-automata'."
        THEME_NAME="nier-automata"
    fi
fi

# Variantes de temas específicos
if [ "$THEME_NAME" == "terraria" ] || [ "$THEME_NAME" == "Genshin" ]; then
    info "Customizing $THEME_NAME background..."
    echo -e "${C_MAIN}${C_BOLD} │  ${C_ACCENT}1 ${C_DIM}❯ ${C_RESET}Time-based"
    echo -e "${C_MAIN}${C_BOLD} │  ${C_ACCENT}2 ${C_DIM}❯ ${C_RESET}Random"
    echo -ne "${C_MAIN}${C_BOLD} ╰─ ${C_YELLOW}Choice [1/2]: ${C_RESET}"
    read -rp "" SUB_OPT
    if [ "$SUB_OPT" == "1" ]; then
        sed -i "s/^background_mode=.*/background_mode=time/" "$THEMES_DIR/$THEME_NAME/theme.conf"
    else
        sed -i "s/^background_mode=.*/background_mode=random/" "$THEMES_DIR/$THEME_NAME/theme.conf"
    fi
fi

if [ "$THEME_NAME" == "clockwork" ]; then
    info "Clockwork — Select variant..."
    echo -e "${C_MAIN}${C_BOLD} │  ${C_ACCENT}1 ${C_DIM}❯ ${C_RESET}Orbital"
    echo -e "${C_MAIN}${C_BOLD} │  ${C_ACCENT}2 ${C_DIM}❯ ${C_RESET}Tape"
    echo -ne "${C_MAIN}${C_BOLD} ╰─ ${C_YELLOW}Choice [1-2]: ${C_RESET}"
    read -rp "" CW_VARIANT
    [ "$CW_VARIANT" == "2" ] && CW_SUBDIR="tape" || CW_SUBDIR="orbital"
    THEME_NAME="clockwork/$CW_SUBDIR"

    if [ "$CW_SUBDIR" == "orbital" ]; then
        echo -e "${C_MAIN}${C_BOLD} │  ${C_ACCENT}1 ${C_DIM}❯ ${C_RESET}Dark Mode"
        echo -e "${C_MAIN}${C_BOLD} │  ${C_ACCENT}2 ${C_DIM}❯ ${C_RESET}Light Mode"
        echo -ne "${C_MAIN}${C_BOLD} ╰─ ${C_YELLOW}Choice [1/2]: ${C_RESET}"
        read -rp "" MODE_S
        [ "$MODE_S" == "2" ] && sed -i "s/^themeMode=.*/themeMode=light/" "$THEMES_DIR/$THEME_NAME/theme.conf" || sed -i "s/^themeMode=.*/themeMode=dark/" "$THEMES_DIR/$THEME_NAME/theme.conf"
    fi
fi

# Guardar la elección
mkdir -p "$HOME/.config/qylock"
echo "$THEME_NAME" >"$HOME/.config/qylock/theme"

# Actualizar el script principal para que sepa qué tema lanzar
sed -i "s|export QS_THEME=.*$|export QS_THEME=\"\${1:-$THEME_NAME}\"|" "$LOCK_SCRIPT"

success "¡Tema '$THEME_NAME' configurado correctamente!"
