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
            score_offset = 50,
          },
          snippets = {
            score_offset = 60, -- Por defecto un pelín por encima para que salte cw~ o for~
            transform_items = function(_, items)
              local col = vim.fn.col(".") - 1
              local line = vim.fn.getline(".")
              local char_before = line:sub(col, col)

              -- 1. Si acabas de escribir un punto '.', ANULA los snippets por completo
              if char_before == "." then
                return {}
              end

              -- 2. Si estás dentro de comillas o atributos HTML, baja los snippets al fondo
              local node = vim.treesitter.get_node()
              if node then
                local t = node:type()
                if vim.tbl_contains({ "string", "string_content", "attribute_value", "quoted_attribute_value" }, t) then
                  for _, item in ipairs(items) do
                    item.score_offset = (item.score_offset or 0) - 200
                  end
                end
              end

              return items
            end,
          },
          path = {
            score_offset = 10,
          },
          buffer = {
            score_offset = -100, -- Palabras del texto plano siempre al pozo
          },
        },
      },

      fuzzy = {
        sorts = { "score", "exact", "sort_text" },
      },

      -- APAGAR las dos ventanas invasivas automáticas
      completion = {
        documentation = {
          auto_show = false, -- Adiós a la sábana gigante de texto que tapa media pantalla
        },
      },
      signature = {
        enabled = false, -- Adiós a la caja flotante pequeña que se queda pegada al teclear
      },

      keymap = {
        preset = "default",
        ["<C-y>"] = {},
        ["<C-ñ>"] = { "accept", "fallback" },
        ["<C-p>"] = {},
        ["<C-b>"] = { "select_prev", "fallback" },
        -- Si en algún momento quieres leer la documentación aposta, usas tus atajos
        ["<C-d>"] = { "scroll_documentation_down", "fallback" },
        ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      },
    },
  },
}
