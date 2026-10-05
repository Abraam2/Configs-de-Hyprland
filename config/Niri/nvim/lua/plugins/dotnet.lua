return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = {
          handlers = {
            -- Silenciar el error específico de índice fuera de rango
            ["textDocument/inlayHint"] = function(err, result, ctx, config)
              if err and err.code == -32603 then
                return
              end
              vim.lsp.handlers["textDocument/inlayHint"](err, result, ctx, config)
            end,
            ["textDocument/semanticTokens/full/delta"] = function(err, result, ctx, config)
              if err and err.code == -32603 then
                return
              end
              vim.lsp.handlers["textDocument/semanticTokens/full/delta"](err, result, ctx, config)
            end,
          },
        },
      },
    },
  },
}
