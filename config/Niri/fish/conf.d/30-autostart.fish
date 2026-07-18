# -----------------------------------------------------
# AUTOSTART
# -----------------------------------------------------

# -----------------------------------------------------
# Fastfetch
# -----------------------------------------------------
# Ejecuta fastfetch SOLO si NO estás en NVIM y además NO has pasado SIN_FETCH
if not set -q NVIM; and not set -q SIN_FETCH
    fastfetch
end
