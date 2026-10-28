return {
  "nvzone/minty",
  cmd = { "Shades", "Huefy" },
  dependencies = { "nvzone/volt" },
  keys = {
    {
      "<leader>cp",
      function()
        local cword = vim.fn.expand("<cword>")
        local is_hex = cword:match("^[%da-fA-F]+$") and (#cword == 3 or #cword == 6)

        -- Si no estamos sobre un color hexadecimal existente, metemos la base
        if not is_hex then
          vim.api.nvim_put({ "#61afef" }, "c", true, true)
          vim.cmd("normal! b")
        end

        require("minty.huefy").open()
      end,
      desc = "Selector de color",
    },
    {
      "<leader>cs",
      function()
        require("minty.shades").open()
      end,
      desc = "Selector de sombras",
    },
  },
}
