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
