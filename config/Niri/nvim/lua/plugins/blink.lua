return {
  {
    "saghen/blink.cmp",
    opts = {
      enabled = function()
        return not vim.tbl_contains({ "markdown", "text" }, vim.bo.filetype)
          and vim.bo.buftype ~= "prompt"
          and vim.b.completion ~= false
      end,

      sources = {
        default = { "lsp", "snippets", "path", "buffer" },
        providers = {
          lsp = {
            score_offset = 100,
            transform_items = function(_, items)
              local snippet_kind = vim.lsp.protocol.CompletionItemKind.Snippet
              for _, item in ipairs(items) do
                if item.kind == snippet_kind then
                  item.score_offset = (item.score_offset or 0) - 150
                end
              end
              return items
            end,
          },
          snippets = {
            score_offset = 10,
            -- Si estás dentro de comillas o cadenas de texto, NO muestres snippets
            enabled = function()
              local node = vim.treesitter.get_node()
              if node and vim.tbl_contains({ "string", "string_content", "attribute_value" }, node:type()) then
                return false
              end
              return true
            end,
          },
          buffer = {
            score_offset = -100,
          },
        },
      },

      -- 'score' primero para que los puntos del LSP manden sobre las coincidencias cortas
      fuzzy = {
        sorts = { "score", "sort_text" },
      },

      keymap = {
        preset = "default",
        ["<C-y>"] = {},
        ["<C-ñ>"] = { "accept", "fallback" },
        ["<C-p>"] = {},
        ["<C-b>"] = { "select_prev", "fallback" },
        ["<C-d>"] = { "scroll_documentation_down", "fallback" },
        ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      },
    },
  },
}
