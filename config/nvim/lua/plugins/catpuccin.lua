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

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, -- ESTO ES CLAVE: Carga el tema nada más abrir Neovim
    priority = 1000, -- Máxima prioridad
    opts = {
      flavour = "mocha",
      transparent_background = false,
      term_colors = true,
      -- Aquí es donde machacamos la negrita
      custom_highlights = function(colors)
        return {
          ["@tag"] = { style = {} },
          ["@tag.builtin"] = { style = {} },
          ["@tag.attribute"] = { style = {} },
          ["@tag.delimiter"] = { style = {} },
          ["htmlTagName"] = { style = {} },
          ["htmlTag"] = { style = {} },
          ["htmlArg"] = { style = {} },
        }
      end,
      integrations = {
        treesitter = true,
        native_lsp = { enabled = true },
        semantic_tokens = true,
      },
    },
    -- Forzamos la carga del tema AQUÍ, para que no lo haga LazyVim por fuera
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
