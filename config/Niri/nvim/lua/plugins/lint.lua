return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      -- Aquí estamos sobreescribiendo la configuración de LazyVim
      -- Le decimos que para archivos 'markdown', no use NADA.
      markdown = {},
    },
  },
}
