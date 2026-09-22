return {
  "barrett-ruth/live-server.nvim",
  cmd = { "LiveServerStart", "LiveServerStop" },
  config = true,
  keys = {
    { "<leader>ls", "<cmd>LiveServerStart<cr>", desc = "Iniciar Live Server" },
    { "<leader>lS", "<cmd>LiveServerStop<cr>", desc = "Detener Live Server" },
  },
}
