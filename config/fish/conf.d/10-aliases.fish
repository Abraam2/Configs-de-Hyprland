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

alias ospina='ssh batoi@172.17.222.20'
alias suso='sudo'
# -----------------------------------------------------
# ARCHIVOS Y NAVEGACIÓN
# -----------------------------------------------------
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -v'
alias mkdir='mkdir -p'
alias f='finder'
alias i='yay -S'
alias ..='z ..'
alias ...='z ../..'



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


