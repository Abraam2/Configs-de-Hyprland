return {
  "uga-rosa/ccc.nvim",
  keys = {
    { "<leader>cP", "<cmd>CccPick<cr>", desc = "Abrir selector de color" },
    { "<leader>cv", "<cmd>CccHighlighterToggle<cr>", desc = "Activar/desactivar colores" },
  },
  config = function()
    local ccc = require("ccc")
    ccc.setup({
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    })
  end,
}
