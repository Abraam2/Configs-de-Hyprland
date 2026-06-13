return {
  {
    "folke/noice.nvim",
    opts = {
      routes = {
        {
          -- Ruta para filtrar los mensajes de progreso del LSP
          filter = {
            event = "lsp",
            kind = "progress",
          },
          opts = { skip = true }, -- Esto los oculta por completo
        },
      },
    },
  },
}
