-- Configuración Catpuccin por defecto, en html tiene negrita en las tags
-- return {
--   -- Primero, le decimos a LazyVim que descargue el plugin
--   {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     priority = 1000, -- Esto hace que el tema cargue antes que nada
--     opts = {
--       flavour = "mocha", -- Aquí es donde elegimos el sabor Mocha
--       transparent_background = false, -- Cambia a true si quieres que se vea el fondo de tu terminal
--       term_colors = true,
--     },
--   },
--
--   -- Segundo, le decimos a LazyVim que use este tema por defecto
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "catppuccin",
--     },
--   },
-- }

-- Cargamos los colores de Matugen de forma segura arriba del todo
local matugen = pcall(require, "config.matugen_colors") and require("config.matugen_colors") or nil

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

        -- Si Matugen generó los colores, obligamos a Snacks a usarlos con "!force"
        if matugen and matugen.logo then
          -- Snacks Dashboard (El que estás usando tú)
          highlights["SnacksDashboardHeader"] = { fg = matugen.logo, style = {} }
          highlights["SnacksDashboardIcon"] = { fg = matugen.logo, style = {} }
          highlights["SnacksDashboardDesc"] = { fg = matugen.botones }
          highlights["SnacksDashboardKey"] = { fg = matugen.logo }
          highlights["SnacksDashboardSpecial"] = { fg = matugen.botones }

          -- Por si acaso, para el Dashboard clásico viejo que también te sale listado
          highlights["DashboardHeader"] = { fg = matugen.logo }
          highlights["DashboardIcon"] = { fg = matugen.logo }
          highlights["DashboardDesc"] = { fg = matugen.botones }
          highlights["DashboardCenter"] = { fg = matugen.botones }
        end

        return highlights
      end,
      
      integrations = {
        treesitter = true,
        native_lsp = { enabled = true },
        semantic_tokens = true,
        -- Desactivamos la integración nativa de dashboard de Catppuccin 
        -- para que no pise nuestros custom_highlights personalizados
        dashboard = false,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}