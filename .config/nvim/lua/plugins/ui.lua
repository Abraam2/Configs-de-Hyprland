-- DiagnosticError (rojo) DiagnosticWarn (amarillo) DiagnosticInfo (azul) DiagnosticHint (turquesa) Constant (naranja) String (verde) Identifier (rosa pálido, muy pálido) Function (azul) Keyword (morado vegeta) Special Type Number Boolean Label Operator Comment

return {
  -- =========================================================================
  -- 1. CONFIGURACIÓN DE WHICH-KEY (Tus atajos con iconos tuneados)
  -- =========================================================================
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader> ", icon = { icon = " ", hl = "String" }, desc = "Find Files (Root Dir)" },
        { "<leader>.", icon = { icon = "󰈔 ", hl = "DiagnosticHint" }, desc = "Switch to Other Buffer" },
        { "<leader>,", icon = { icon = "󰈔 ", hl = "DiagnosticHint" }, desc = "Toggle Scratch Buffer" },
        { "<leader>e", icon = { icon = " ", hl = "@tag" }, desc = "Explorer Snacks (root dir)" },
        { "<leader>E", icon = { icon = " ", hl = "@tag" }, desc = "Explorer Snacks (cwd)" },
        { "<leader>ñ", icon = { icon = " ", hl = "@tag" }, desc = "Open Oil (Text file explorer)" },
        { "<leader>/", icon = { icon = "󰈞 ", hl = "DiagnosticHint" }, desc = "Grep (Root Dir)" },
        { "<leader>n", icon = { icon = "󰂚 ", hl = "Constant" }, desc = "Notification History" },
        { "<leader>:", icon = { icon = " ", hl = "DiagnosticWarn" }, desc = "Command History" },
        { "<leader>r", icon = { icon = "󰐊", hl = "Keyword" }, desc = "Run Code" },
        { "<leader>j", icon = { icon = "", hl = "DiagnosticError" }, desc = "Save file" },
        { "<leader>J", icon = { icon = "", hl = "DiagnosticError" }, desc = "Save As Sudo" },
        { "<leader>q", icon = { icon = "", hl = "DiagnosticError" }, desc = "quit/session" },
        { "<leader>P", icon = { icon = "", hl = "DiagnosticWarn" }, desc = "Paste With Autoidentation" },
        { "<leader>y", icon = { icon = "", hl = "DiagnosticWarn" }, desc = "Paste Last Yanked" },
      },
    },
  },

  -- =========================================================================
  -- 2. CONFIGURACIÓN DE SNACKS.NVIM (Dashboard con todos tus botones)
  -- =========================================================================

  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "p", desc = "Projects", action = ":lua Snacks.picker.projects()" },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = function()
                Snacks.picker.files({ cwd = vim.fn.expand("~/.config/nvim") })
              end,
            },
            { icon = " ", key = "s", desc = "Restore Session", action = ':lua require("persistence").load()' },
            {
              icon = "󱂬 ",
              key = "S",
              desc = "Select Session Menu",
              action = ':lua require("persistence").select()',
            },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  },
}
