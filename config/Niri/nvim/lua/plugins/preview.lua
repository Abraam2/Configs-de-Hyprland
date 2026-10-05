return {
  "brianhuster/live-preview.nvim",
  cmd = { "LivePreview" },
  opts = {},
  keys = {
    { "<leader>ls", "<cmd>LivePreview start<cr>", desc = "Iniciar Live Preview" },
    { "<leader>lS", "<cmd>LivePreview close<cr>", desc = "Detener Live Preview" },
    {
      "<leader>lp",
      function()
        local root = vim.fs.root(0, ".git") or vim.fn.expand("%:p:h")

        vim.fn.chdir(root)

        -- 3. Abre el picker restringido a tu proyecto
        vim.cmd("LivePreview pick")
      end,
      desc = "Seleccionar archivo del proyecto",
    },
  },
}
