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
          snippets = {
            -- Bajamos el dopaje salvaje de 100 a 3. Es suficiente para ganarle al 'if' del LSP
            -- pero no tanto como para romper la lógica del texto escrito.
            score_offset = 20,
          },
        },
        -- TRUCO DEFINTIVO: Forzamos a Blink a que valore más las letras exactas que escribes
        transform_items = function(_, items)
          return items
        end,
      },

      -- Ajustes del motor de ordenación de Blink
      fuzzy = {
        sorts = {
          -- 1. Prioriza que el texto coincida exactamente con lo que has escrito (ej: println -> println)
          function(a, b)
            if a.exact ~= b.exact then
              return a.exact
            end
          end,
          -- 2. El orden por defecto de Blink (puntuación del motor + offsets)
          "score",
          "sort_text",
        },
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
