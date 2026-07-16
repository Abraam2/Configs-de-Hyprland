return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    -- Este va a ser tu atajo oficial para abrir Yazi en un panel flotante
    {
      "<leader>fy",
      function()
        require("yazi").yazi()
      end,
      desc = "Abrir Yazi (Gestor de archivos)",
    },
    {
      "<leader>Y",
      function()
        require("yazi").yazi()
      end,
      desc = "Open Yazi",
    },
    -- Este abre Yazi pero mostrando el historial de archivos modificados en Git
    -- {
    --   "<leader>gy",
    --   function()
    --     require("yazi").toggle_git_status()
    --   end,
    --   desc = "Yazi Git Status",
    -- },
  },
  opts = {
    open_for_directories = false, -- No secuestra a Neovim si abres una carpeta desde la terminal
    keymaps = {
      show_help = "<f1>", -- F1 para ver la ayuda dentro de Yazi
    },
  },
}
