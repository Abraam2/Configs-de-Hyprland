return {
  {
    "saghen/blink.cmp",
    opts = {
      -- 1. Filtros de archivos de siempre
      enabled = function()
        return not vim.tbl_contains({ "markdown", "text" }, vim.bo.filetype)
          and vim.bo.buftype ~= "prompt"
          and vim.b.completion ~= false
      end,

      -- Configuración inteligente de fuentes y ordenación
      sources = {
        default = { "lsp", "snippets", "path", "buffer" },
        providers = {
          lsp = {
            -- Los snippets que manda Roslyn (cw, svm, tryf...) pasan al final de la lista
            transform_items = function(_, items)
              local snippet_kind = vim.lsp.protocol.CompletionItemKind.Snippet
              for _, item in ipairs(items) do
                if item.kind == snippet_kind then
                  item.score_offset = (item.score_offset or 0) - 100
                end
              end
              return items
            end,
          },
          snippets = {
            score_offset = -100,
          },
        },
      },

      fuzzy = {
        sorts = { "exact", "score", "sort_text" },
      },

      -- 2. El teclado de Blink corregido por un profesional (tú)
      keymap = {
        preset = "default",

        ["<C-y>"] = {}, -- Liberado para Yanky
        ["<C-ñ>"] = { "accept", "fallback" }, -- Tu confirmación

        -- Ctrl + p se va a la calle en Blink
        ["<C-p>"] = {},

        -- Y Ctrl + b toma el relevo para subir en la lista de sugerencias (select_prev)
        ["<C-b>"] = { "select_prev", "fallback" },
        ["<C-d>"] = { "scroll_documentation_down", "fallback" },
        -- Ctrl + u SUBE la barra de info (así evitas usar la letra B)
        ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      },
    },
  },
}
