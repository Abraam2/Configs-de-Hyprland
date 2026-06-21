-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Cada vez que dejes de escribir 1 segundo, Neovim "guarda partida" automáticamente
vim.api.nvim_create_autocmd("CursorHoldI", {
  callback = function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-g>u", true, true, true), "n", true)
  end,
})
-- Bajamos el tiempo de reacción a 1 segundo (o 500ms si eres rápido)
vim.opt.updatetime = 800

-- Activar corrector ortográfico solo en archivos de texto
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "plaintex", "gitcommit" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt.spelllang = { "es", "en" }
  end,
})

-- Forzar el tipo de archivo jsonc en la configuración de Waybar para permitir comentarios
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*/waybar/config", "*/waybar/*.json" },
  callback = function()
    vim.bo.filetype = "jsonc"
  end,
})

-- Forzar que Neovim respete las reglas de Stylua (2 espacios) solo en archivos Lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.shiftwidth = 2 -- Los saltos de indentación son de 2 espacios
    vim.opt_local.tabstop = 2 -- El tamaño visual del tabulador es 2
    vim.opt_local.expandtab = true -- Convierte los tabuladores a espacios reales
  end,
})
