return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        -- Verdes (Búsqueda)
        { "<leader>,", icon = { icon = " ", hl = "String" }, desc = "Search Buffer" },
        { "<leader> ", icon = { icon = " ", hl = "String" }, desc = "Find Files (Root Dir)" },
        
        -- Azul Verdoso / Turquesa (Archivos y Exploradores)
        { "<leader>.", icon = { icon = "󰈔 ", hl = "@tag" }, desc = "Switch to Other Buffer" },
        { "<leader>e", icon = { icon = " ", hl = "@tag" }, desc = "Explorer Snacks (root dir)" },
        { "<leader>E", icon = { icon = " ", hl = "@tag" }, desc = "Explorer Snacks (cwd)" },
        { "<leader>/", icon = { icon = "󰈞 ", hl = "@tag" }, desc = "Grep (Root Dir)" },
        
        -- Otros colores
        { "<leader>n", icon = { icon = "󰂚 ", hl = "Constant" }, desc = "Notification History" }, -- Naranja
        { "<leader>S", icon = { icon = "󱞁 ", hl = "Statement" }, desc = "Select Scratch Buffer" }, -- Morado
        { "<leader>:", icon = { icon = " ", hl = "DiagnosticWarn" }, desc = "Command History" }, -- Amarillo
        { "<leader>K", icon = { icon = " ", hl = "Function" }, desc = "Keywordprg (Manual)" }, -- Azul
      },
    },
  },
}