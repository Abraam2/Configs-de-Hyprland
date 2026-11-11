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
            score_offset = 60, -- Tus snippets habituales (cw, for) siguen saliendo arriba
            transform_items = function(_, items)
              local col = vim.fn.col(".") - 1
              local line = vim.fn.getline(".")
              local char_before = line:sub(col, col)
              local ft = vim.bo.filetype

              -- 1. Si acabas de escribir un punto '.', ANULA snippets (C#, JS, etc.)
              if char_before == "." then
                return {}
              end

              -- 2. En CSS: dentro de una propiedad (después de ':') no queremos basura de snippets
              if ft == "css" or ft == "scss" or ft == "less" then
                local before_cursor = line:sub(1, col)
                if before_cursor:find(":%s*[%w_-]*$") then
                  return {} -- Cero snippets en valores de CSS (como colores o fuentes)
                end
              end

              -- 3. Si estás dentro de comillas o atributos HTML, baja los snippets al fondo
              local ok, node = pcall(vim.treesitter.get_node)
              if ok and node then
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
            score_offset = -100, -- Palabras de texto plano al fondo
          },
        },
      },

      fuzzy = {
        sorts = { "score", "exact", "sort_text" },
      },

      -- Mantener apagadas las ventanas molestas
      completion = {
        documentation = {
          auto_show = false,
        },
      },
      signature = {
        enabled = false,
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
