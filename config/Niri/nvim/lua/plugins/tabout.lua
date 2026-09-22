return {
  {
    "abecodes/tabout.nvim",
    event = "InsertEnter",
    priority = 1000,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      tabkey = "<Tab>",
      backwards_tabkey = "<S-Tab>",
      act_as_tab = true,
      act_as_shift_tab = false,
      default_tab = "<Tab>", -- Cámbialo aquí a <Tab>
      default_shift_tab = "<S-Tab>", -- Opcional, pero más natural que <C-d>
      enable_backwards = true,
      completion = false,
      tabouts = {
        { open = "'", close = "'" },
        { open = '"', close = '"' },
        { open = "`", close = "`" },
        { open = "(", close = ")" },
        { open = "[", close = "]" },
        { open = "{", close = "}" },
      },
      ignore_beginning = true, -- Mantén esto en true para que idente al inicio
      exclude = {},
    },
  },
}
