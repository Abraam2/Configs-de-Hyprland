# -----------------------------------------------------
# INIT
# -----------------------------------------------------

set -U fish_greeting ""
zoxide init fish | source

# -----------------------------------------------------
# Exports
# -----------------------------------------------------
set -gx EDITOR $HOME/scripts-global/nv
set -U fish_user_paths /usr/lib/ccache/bin/
set -U fish_user_paths $fish_user_paths $HOME/.cargo/bin/
set -U fish_user_paths $fish_user_paths $HOME/.local/bin/
set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
fish_add_path --path --prepend /home/abraham/scripts-global
