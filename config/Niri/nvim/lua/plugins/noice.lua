return {
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        signature = { auto_open = { enabled = false } },
      },
      routes = {
        {
          filter = { event = "lsp", kind = "progress" },
          opts = { skip = true },
        },
      },
    },
  },
}
