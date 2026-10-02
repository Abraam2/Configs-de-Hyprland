return {
  "brianhuster/live-preview.nvim",
  cmd = { "LivePreview" },
  keys = {
    { "<leader>ls", "<cmd>LivePreview start<cr>", desc = "Iniciar Live Preview" },
    { "<leader>lS", "<cmd>LivePreview close<cr>", desc = "Detener Live Preview" },
    { "<leader>lp", "<cmd>LivePreview pick<cr>", desc = "Seleccionar archivo" },
  },
}
