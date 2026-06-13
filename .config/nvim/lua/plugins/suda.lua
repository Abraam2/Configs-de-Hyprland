return {
  "lambdalisue/vim-suda",
  -- Cargamos el plugin solo cuando uses estos comandos para no ralentizar el editor
  cmd = { "SudaRead", "SudaWrite" },
  init = function()
    -- Esta es la magia: detecta solo si hace falta sudo
    vim.g.suda_smart_edit = 1
  end,
}
