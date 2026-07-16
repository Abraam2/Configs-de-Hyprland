# -----------------------------------------------------
# INIT
# -----------------------------------------------------

set -U fish_greeting ""
zoxide init fish | source

# -----------------------------------------------------
# Exports
# -----------------------------------------------------
set -gx EDITOR $HOME/.local/bin/nv
set -U fish_user_paths /usr/lib/ccache/bin/
set -U fish_user_paths $fish_user_paths $HOME/.cargo/bin/
set -U fish_user_paths $fish_user_paths $HOME/.local/bin/
fish_add_path --path --prepend /home/abraham/scripts-global
