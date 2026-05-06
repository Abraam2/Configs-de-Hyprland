-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.spell = true -- Activa el corrector por defecto al arrancar
vim.opt.spelllang = { "es", "en" } -- Configura español e inglés

-- Activa el ajuste de línea visual
vim.opt.wrap = true

-- Hace que el corte se haga por palabras completas, no a mitad de una letra
vim.opt.linebreak = true

-- Mantiene la sangría (indentación) en las líneas que "caen" abajo
vim.opt.breakindent = true
-- TODO: Hola, esto es una cosa que hay que hacer, salu2.
