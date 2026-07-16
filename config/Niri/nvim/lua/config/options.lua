-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- TODO: Hola, esto es una cosa que hay que hacer, salu2.

vim.opt.spell = false -- Activa el corrector por defecto al arrancar

vim.opt.mouse = ""

-- Activa el ajuste de línea visual
vim.opt.wrap = true

-- Hace que el corte se haga por palabras completas, no a mitad de una letra
vim.opt.linebreak = true

-- Mantiene la sangría (indentación) en las líneas que "caen" abajo
vim.opt.breakindent = true

-- Evitar que Neovim meta asteriscos automáticos al dar Intro en comentarios de Java
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    -- Eliminamos 'r' (intro en modo insertar) y 'o' (abrir línea con o/O) de formatoptions
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})

-- ==============================================================
-- FORZAR INDENTACIÓN PERFECTA DE 4 ESPACIOS (Sincronizado con Conform)
-- ==============================================================
vim.opt.tabstop = 4 -- Un tabulador físico visualmente mide 4 espacios
vim.opt.shiftwidth = 4 -- El tamaño de la sangría (lo que mete la 'o' o el '>>') es de 4 espacios
vim.opt.softtabstop = 4 -- Al pulsar Tab en modo insertar, mete 4 espacios
vim.opt.expandtab = true -- Transforma los tabuladores en espacios reales para que clang-format no llore

-- Evitar que smartindent de Java se vuelva loco con los bloques
vim.opt.smartindent = true
