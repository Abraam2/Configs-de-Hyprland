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
        { "<leader>B", icon = { icon = " ", hl = "String" }, desc = "Search Lines In Buffer" },
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
}
