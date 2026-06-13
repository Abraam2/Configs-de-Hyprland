return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        java = { "clang-format" },
      },

      formatters = {
        ["clang-format"] = {
          -- ColumnLimit a 0 desactiva el salto de línea automático.
          -- BreakStringLiterals a false prohíbe terminantemente partir textos.
          prepend_args = {
            "-style={BasedOnStyle: Google, ColumnLimit: 10000, IndentWidth: 4, ContinuationIndentWidth: 4, BreakStringLiterals: false, AlignAfterOpenBracket: Align, IndentCaseLabels: true}",
          },
        },
      },

      default_format_opts = {
        lsp_format = "fallback",
      },
    },
  },
}
