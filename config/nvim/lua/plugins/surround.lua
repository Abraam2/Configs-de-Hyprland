return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    -- 1. Desactivamos los mapas por defecto para no pisar nada
    vim.g.nvim_surround_no_mappings = true

    require("nvim-surround").setup({})

    -- 2. Mapeamos todo a la Ñ
    -- ñd -> Delete Surround
    vim.keymap.set("n", "ñd", "<Plug>(nvim-surround-delete)", { desc = "Delete surround" })

    -- ñc -> Change Surround
    vim.keymap.set("n", "ñc", "<Plug>(nvim-surround-change)", { desc = "Change surround" })

    -- ñs -> You Surround (Añadir)
    vim.keymap.set("n", "ñs", "<Plug>(nvim-surround-normal)", { desc = "Add surround" })

    -- ñS -> Surround visual selection (VS Code style)
    vim.keymap.set("x", "ñs", "<Plug>(nvim-surround-visual)", { desc = "Add surround (visual)" })
  end,
}
