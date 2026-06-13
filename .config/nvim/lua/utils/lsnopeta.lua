local M = {}

function M.run_code()
  -- 1. Guardar el archivo actual
  vim.cmd("silent! write")

  -- 2. LIMPIEZA INTELIGENTE (Sin activar alarmas)
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buftype == "terminal" then
      -- 'noautocmd' evita que salte el error E937 de tu captura
      vim.cmd("noautocmd bdelete! " .. buf)
    end
  end

  -- 3. Comando (Volvemos al ls para asegurar que la base es sólida)
  local cmd = "bash -c 'ls -la; echo; echo \"--- Proceso terminado. Intro para cerrar ---\"; read'"

  -- 4. Abrir terminal con silenciador para Snacks
  require("snacks").terminal.open(cmd, {
    win = { position = "bottom", height = 10 },
    -- Esto evita el mensaje "Terminal exited with code -1"
    on_exit = function() end,
  })

  -- 5. El truco trucho del Intro
  vim.schedule(function()
    local buf = vim.api.nvim_get_current_buf()

    -- Forzamos modo normal
    vim.cmd("stopinsert")

    -- Mapeo trucho: i + Intro
    vim.keymap.set("n", "<CR>", "i<CR>", { buffer = buf, remap = true })

    -- Autocomando para cuando TÚ cierras el buffer manualmente
    vim.api.nvim_create_autocmd("TermClose", {
      buffer = buf,
      callback = function()
        pcall(function()
          if vim.api.nvim_buf_is_valid(buf) then
            -- Usamos pcall por si acaso ya se está borrando
            vim.api.nvim_buf_delete(buf, { force = true })
          end
        end)
      end,
    })
  end)
end

return M
