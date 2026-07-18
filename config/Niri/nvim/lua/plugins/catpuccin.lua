-- Cargamos los colores de Matugen de forma segura arriba del todo
local matugen = pcall(require, "config.noctalia-custom") and require("config.noctalia-custom") or nil

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = false,
      term_colors = true,

      custom_highlights = function(colors)
        local highlights = {
          -- Tus cambios para machacar la negrita en HTML
          ["@tag"] = { style = {} },
          ["@tag.builtin"] = { style = {} },
          ["@tag.attribute"] = { style = {} },
          ["@tag.delimiter"] = { style = {} },
          ["htmlTagName"] = { style = {} },
          ["htmlTag"] = { style = {} },
          ["htmlArg"] = { style = {} },
        }

        -- Si Matugen generó los colores, mapeamos todo el ecosistema
        if matugen then
          -- 1. Dashboard de Snacks y clásico
          if matugen.logo then
            highlights["SnacksDashboardHeader"] = { fg = matugen.logo, style = {} }
            highlights["SnacksDashboardIcon"] = { fg = matugen.logo, style = {} }
            highlights["SnacksDashboardKey"] = { fg = matugen.logo }
            highlights["DashboardHeader"] = { fg = matugen.logo }
            highlights["DashboardIcon"] = { fg = matugen.logo }
          end

          if matugen.botones then
            highlights["SnacksDashboardDesc"] = { fg = matugen.botones }
            highlights["SnacksDashboardSpecial"] = { fg = matugen.botones }
            highlights["DashboardDesc"] = { fg = matugen.botones }
            highlights["DashboardCenter"] = { fg = matugen.botones }
          end

          -- 2. Líneas divisorias (Se acabó el azul genérico de Catppuccin)
          if matugen.lineas then
            highlights["WinSeparator"] = { fg = matugen.lineas, bold = true }
            highlights["NeoTreeWinSeparator"] = { fg = matugen.lineas, bold = true }
          end

          -- 3. Iconos y nombres de carpetas en Neo-tree
          if matugen.carpetas then
            highlights["NeoTreeDirectoryIcon"] = { fg = matugen.carpetas }
            highlights["NeoTreeDirectoryName"] = { fg = matugen.carpetas }
            -- Por si quieres que los estados abiertos/cerrados también sigan el color
            highlights["NeoTreeExpander"] = { fg = matugen.carpetas }
          end
        end

        return highlights
      end,

      integrations = {
        treesitter = true,
        native_lsp = { enabled = true },
        semantic_tokens = true,
        dashboard = false,
        -- Aseguramos la integración nativa con Neo-tree
        neotree = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
