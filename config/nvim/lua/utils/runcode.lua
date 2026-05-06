local M = {}

function M.run_code()
  -- 1. DICCIONARIO DE LENGUAJES (Lo movemos arriba para usarlo como filtro)
  local configs = {
    python = { exe = "python3", cmd = "export PYTHON_COLORS=1; python3 -u " },
    javascript = { exe = "node", cmd = "export FORCE_COLOR=1; node " },
    typescript = { exe = "tsx", cmd = "export FORCE_COLOR=1; tsx " },
    c = { exe = "gcc", cmd = "gcc -fdiagnostics-color=always " },
    cpp = { exe = "g++", cmd = "g++ -fdiagnostics-color=always " },
    lua = { exe = "lua", cmd = "lua " },
    bash = { exe = "bash", cmd = "bash " },
    sh = { exe = "bash", cmd = "bash " },
    go = { exe = "go", cmd = "go run " },
    rust = { exe = "rustc", cmd = "rustc --color always " },
  }

  -- 2. IDENTIFICAR EL ARCHIVO REAL (Escaneo inteligente)
  local initial_buf = vim.api.nvim_get_current_buf()
  local target_buf = nil

  -- Si el buffer actual es código, lo usamos directamente
  if vim.bo[initial_buf].buftype == "" and configs[vim.bo[initial_buf].filetype] then
    target_buf = initial_buf
  else
    -- Si estamos en terminal o cualquier otro sitio, buscamos el buffer de código más reciente
    local bufs = vim.api.nvim_list_bufs()
    for i = #bufs, 1, -1 do
      local b = bufs[i]
      if vim.api.nvim_buf_is_valid(b) and vim.bo[b].buftype == "" and configs[vim.bo[b].filetype] then
        target_buf = b
        break
      end
    end
  end

  -- [MENSAJE DE ERROR]: Si tras buscar no encontramos nada ejecutable
  if not target_buf then
    vim.notify(
      "󱐌 No se puede ejecutar. Revisa el foco y si el lenguaje está soportado",
      vim.log.levels.WARN,
      { title = "Runner" }
    )
    return
  end

  -- EXTRAEMOS DATOS DEL OBJETIVO ENCONTRADO
  local file = vim.api.nvim_buf_get_name(target_buf)
  local ft = vim.bo[target_buf].filetype
  local name = vim.fn.fnamemodify(file, ":t:r")
  local cwd = vim.fn.fnamemodify(file, ":p:h")
  local config = configs[ft]

  -- [ERROR TIPO 2]: Programa no instalado
  if vim.fn.executable(config.exe) == 0 then
    vim.notify(
      "󰚌 El programa '" .. config.exe .. "' no está instalado en el sistema.",
      vim.log.levels.ERROR,
      { title = "Runner" }
    )
    return
  end

  -- 3. PROCEDER CON LA EJECUCIÓN
  -- Guardamos el buffer de código aunque no tengamos el foco en él
  vim.api.nvim_buf_call(target_buf, function()
    vim.cmd("silent! write")
  end)

  -- Limpieza de terminales (sigilo)
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buftype == "terminal" then
      vim.cmd("noautocmd bdelete! " .. buf)
    end
  end

  -- Construcción del comando según el lenguaje (ajuste para compilados)
  local final_exec_cmd = config.cmd .. file
  if ft == "c" or ft == "cpp" or ft == "rust" then
    final_exec_cmd = string.format("%s %s -o %s/%s && %s/%s", config.cmd, file, cwd, name, cwd, name)
  end

  -- 4. LANZAMIENTO
  local cmd_final = string.format(
    "bash -c 'export TERM=xterm-256color; %s; echo; echo \"--- Proceso terminado. Intro para cerrar ---\"; read'",
    final_exec_cmd
  )

  require("snacks").terminal.open(cmd_final, {
    win = {
      position = "bottom",
      height = 12,
      wo = { winbar = "", number = false, relativenumber = false },
    },
    cwd = cwd,
    on_exit = function() end,
  })

  -- 5. CONFIGURACIÓN DEL RESULTADO
  vim.schedule(function()
    local buf = vim.api.nvim_get_current_buf()
    pcall(vim.api.nvim_buf_set_name, buf, "Ejecución: " .. ft)
    vim.cmd("stopinsert")
    vim.keymap.set("n", "<CR>", "i<CR>", { buffer = buf, remap = true })

    vim.api.nvim_create_autocmd("TermClose", {
      buffer = buf,
      callback = function()
        pcall(function()
          if vim.api.nvim_buf_is_valid(buf) then
            vim.cmd("bdelete!")
          end
        end)
      end,
    })
  end)
end

return M
