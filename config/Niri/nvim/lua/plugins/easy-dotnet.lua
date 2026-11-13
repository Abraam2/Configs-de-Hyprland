return {
  {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/snacks.nvim",
    },
    ft = { "cs", "csproj", "sln" },
    config = function()
      local dotnet = require("easy-dotnet")
      dotnet.setup({
        diagnostics = {
          default_severity = "warning", -- "error" or "warning" (default: "error")
          setqflist = false, -- Populate quickfix list automatically (default: false)
        },
        picker = "snacks",
        server = {
          log_level = "Verbose", -- Obliga al servidor a cantar todo
        },
        lsp = {
          roslynator_enabled = false,
          auto_refresh_codelens = false, -- deja de refrescar las lentes solo
          config = {
            settings = {
              ["csharp|code_lens"] = {
                dotnet_enable_references_code_lens = false, -- quita "0 referencias"
                dotnet_enable_tests_code_lens = false,
              },
            },
          },
        },
      })
    end,
  },
}
