-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Buscar archivos incluyendo ocultos y tal

vim.keymap.set("n", "<leader>fa", function()
  Snacks.picker.files({ hidden = true, ignored = true })
end, { desc = "Find files including hidden and gitignored" })

-- Guardar con sudo
vim.api.nvim_create_user_command("SW", function()
  vim.cmd("SudaWrite")
end, { desc = "Guardar con Suda" })

vim.keymap.set("n", "<leader>qw", "<cmd>SW<cr>", { desc = "Write as sudo UwU" })

-- Cd rápido a lugares clave
local wk = require("which-key")

-- Registramos la categoría y los atajos en la tecla 'h'
wk.add({
  { "<leader>h", group = "directorios", icon = "󰉖 " },
  { "<leader>hh", "<cmd>cd ~<cr><cmd>pwd<cr>", desc = "Go to Home (~)" },
  { "<leader>hc", "<cmd>cd ~/.config<cr><cmd>pwd<cr>", desc = "Go to Config" },
  { "<leader>hd", "<cmd>cd ~/Descargas<cr><cmd>pwd<cr>", desc = "Go to Descargas" },
  { "<leader>he", "<cmd>cd /etc<cr><cmd>pwd<cr>", desc = "Go to /etc" },
})

-- Cambiar el atajo de alternar buffers por el . y el scratch buffer por ` para que no sea una tecla muerta y sea mejor

-- 1. Borramos los atajos originales para que no haya conflictos
vim.keymap.del("n", "<leader>.")
vim.keymap.del("n", "<leader>`")

vim.keymap.set("n", "<leader>.", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

vim.keymap.set("n", "<leader>`", function()
  Snacks.scratch()
end, { desc = "Toggle Scratch Buffer" })
