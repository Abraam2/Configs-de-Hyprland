return {
  "brianhuster/live-preview.nvim",
  cmd = { "LivePreview" },
  opts = {},
  keys = {
    {
      "<leader>ls",
      function()
        -- 1. Si el archivo no está guardado en disco, lo guardamos para registrar el path
        if vim.bo.modified then
          vim.cmd("silent! write")
        end

        local filepath = vim.api.nvim_buf_get_name(0)
        if filepath == "" then
          vim.notify("Guarda el archivo con un nombre primero", vim.log.levels.WARN)
          return
        end

        -- 2. Aseguramos el directorio de trabajo donde reside el archivo
        local dir = vim.fs.dirname(filepath)
        if dir and dir ~= "" then
          vim.fn.chdir(dir)
        end

        -- 3. Si ya había una instancia previa colgada o tonta, la cerramos
        pcall(function()
          vim.cmd("LivePreview close")
        end)

        -- 4. Levantamos el preview pasándole directamente el archivo abierto
        vim.cmd("LivePreview start " .. vim.fn.fnameescape(filepath))
      end,
      desc = "Iniciar Live Preview",
    },
    { "<leader>lS", "<cmd>LivePreview close<cr>", desc = "Detener Live Preview" },
    {
      "<leader>lp",
      function()
        local root = vim.fs.root(0, ".git") or vim.fn.expand("%:p:h")
        if root and root ~= "" then
          vim.fn.chdir(root)
        end
        vim.cmd("LivePreview pick")
      end,
      desc = "Seleccionar archivo del proyecto",
    },
  },
}
