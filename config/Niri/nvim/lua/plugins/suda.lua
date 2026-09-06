return {
  "lambdalisue/vim-suda",
  -- Cargamos el plugin solo cuando uses estos comandos para no ralentizar el editor
  cmd = { "SudaRead", "SudaWrite" },
  init = function()
    vim.g.suda_smart_edit = 0
  end,
}
