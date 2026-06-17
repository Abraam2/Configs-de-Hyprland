return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        -- 1. Redefinimos la "d" para que ahora sea tu grupo de directorios
        -- Al darle un nuevo nombre y quitar el 'hidden', machacamos lo anterior
        { "<leader>d", group = "directorios", icon = "󰉖 ", hidden = false },

        -- 2. Metemos tus atajos dentro de la "d"
        { "<leader>dd", "<cmd>cd ~/Descargas<cr><cmd>lua vim.notify(vim.fn.getcwd())<cr>", desc = "Go to Descargas" },
        {
          "<leader>dm",
          "<cmd>cd ~/.mydotfiles/com.ml4w.dotfiles/.config/<cr><cmd>lua vim.notify(vim.fn.getcwd())<cr>",
          desc = "Go to ML4W Config",
        },
        { "<leader>dh", "<cmd>cd ~<cr><cmd>lua vim.notify(vim.fn.getcwd())<cr>", desc = "Go to Home (~)" },
        { "<leader>df", "<cmd>cd %:p:h<cr><cmd>lua vim.notify(vim.fn.getcwd())<cr>", desc = "Go to current file dir" },
        { "<leader>dc", "<cmd>cd ~/.config<cr><cmd>lua vim.notify(vim.fn.getcwd())<cr>", desc = "Go to Config" },
        { "<leader>de", "<cmd>cd /etc<cr><cmd>lua vim.notify(vim.fn.getcwd())<cr>", desc = "Go to /etc" },
        { "<leader>dp", "<cmd>lua vim.notify(vim.fn.getcwd())<cr>", desc = "Where am I? (pwd)" },
      },
    },
  },
}
