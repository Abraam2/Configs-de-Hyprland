return {
  -- Primero, le decimos a LazyVim que descargue el plugin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Esto hace que el tema cargue antes que nada
    opts = {
      flavour = "mocha", -- Aquí es donde elegimos el sabor Mocha
      transparent_background = false, -- Cambia a true si quieres que se vea el fondo de tu terminal
      term_colors = true,
    },
  },

  -- Segundo, le decimos a LazyVim que use este tema por defecto
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
