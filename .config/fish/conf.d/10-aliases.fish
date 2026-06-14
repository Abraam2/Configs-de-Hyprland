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
# -----------------------------------------------------
# ARCHIVOS Y NAVEGACIÓN
# -----------------------------------------------------
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -v'
alias mkdir='mkdir -p'
alias f='finder'
alias i='yay -S'
alias n='nv'
alias nvim='nv'
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

alias gs="git status"
alias lg="lazygit"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gst="git stash"
alias gsp="git stash; git pull"
alias gfo="git fetch origin"
alias gcheck="git checkout"
alias gcredential="git config credential.helper store"


