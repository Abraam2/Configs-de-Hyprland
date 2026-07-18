return {
  "xiyaowong/transparent.nvim",
  lazy = false,
  config = function()
    require("transparent").setup({
      extra_groups = {
        "NormalFloat",
        "FloatBorder",
        "NeoTreeNormal",
        "NeoTreeNormalNC",
        "SignColumn",
        "LineNr",
        "CursorLineNr",
        "StatusLine",
        "StatusLineNC",
      },
    })

    -- 🛠️ MAGIA: Forzamos a que las líneas divisorias resalten
    -- Usamos el color de los bordes del tema (puedes cambiar 'Title' por 'Primary' o el que quieras)
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        -- Línea vertical de separación global (para la terminal y buffers divididos)
        vim.api.nvim_set_hl(0, "WinSeparator", { link = "Title", bold = true })
        -- Línea vertical específica de Neo-tree
        vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { link = "Title", bold = true })
      end,
    })
  end,
}
