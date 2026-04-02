return {
  {
    "saghen/blink.cmp",
    opts = {
      -- Aquí le decimos en qué archivos NO queremos que se active
      enabled = function()
        return not vim.tbl_contains({ "markdown", "text" }, vim.bo.filetype)
          and vim.bo.buftype ~= "prompt"
          and vim.b.completion ~= false
      end,
    },
  },
}
