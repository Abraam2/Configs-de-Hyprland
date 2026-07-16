return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        view_options = {
          show_hidden = true,
          is_always_hidden = function(name)
            return name == ".." or name == ".git"
          end,
        },
      })
      -- Mapeo rápido dentro de tu sección de navegación
      -- vim.keymap.set("n", "ñ", "<CMD>Oil<CR>", { desc = "Abrir Oil (Explorador de texto)" })
      -- vim.keymap.set("n", "<leader>ñ", "<CMD>Oil<CR>", { desc = "Abrir Oil (Explorador de texto)" })
    end,
  },
}
