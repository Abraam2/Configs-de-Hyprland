return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts.sources = opts.sources or {}
    opts.sources.providers = opts.sources.providers or {}

    -- Fuente propia con las etiquetas como snippet "etiqueta { cursor }"
    opts.sources.providers.css_tags = {
      name = "CSS tags",
      module = "utils.css_tags",
      score_offset = 100,
    }

    -- En CSS: mis etiquetas primero y sin "buffer"
    opts.sources.per_filetype = opts.sources.per_filetype or {}
    opts.sources.per_filetype.css = { "css_tags", "lsp", "path", "snippets" }

    -- Filtro seguro: solo actúa en un selector de primer nivel (línea sin sangría)
    opts.sources.providers.lsp = vim.tbl_deep_extend("force", opts.sources.providers.lsp or {}, {
      transform_items = function(_, items)
        if vim.bo.filetype ~= "css" then
          return items
        end

        local line = vim.api.nvim_get_current_line()
        local col = vim.fn.col(".") - 1
        local before = line:sub(1, col)

        -- Si la línea tiene sangría, estás dentro de un bloque: no se toca nada
        if before:match("^%s") then
          return items
        end
        -- Si escribes ":" a propósito, te dejo las pseudo-clases
        if before:match(":[%w%-]*$") then
          return items
        end
        -- Si treesitter no está seguro de que estás fuera de llaves, no se toca
        if not require("utils.css_tags").outside_braces() then
          return items
        end

        -- Selector de primer nivel: del LSP solo dejo los @ (@media, @import...)
        return vim.tbl_filter(function(item)
          return (item.label or ""):sub(1, 1) == "@"
        end, items)
      end,
    })
  end,
}
