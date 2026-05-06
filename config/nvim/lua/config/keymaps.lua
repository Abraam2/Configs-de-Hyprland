-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

---@diagnostic disable-next-line: undefined-global
local LazyVim = require("lazyvim.util")
local wk = require("which-key")

-------------------------------------------------------------------------------
--                                  ÍNDICE                                   --
-------------------------------------------------------------------------------
-- 1. ARCHIVOS Y NAVEGACIÓN ............................. (Búsqueda, Rutas)
-- 2. GUARDADO INTELIGENTE .............................. (Sudo, Smart Save)
-- 3. TERMINAL .......................................... (Toggle Inteligente)
-- 4. SCRATCH BUFFERS ................................... (Markdown, Picker)
-- 5. EJECUCIÓN DE CÓDIGO ............................... (Run Code)
-- 6. EDICIÓN Y MOVIMIENTO .............................. (Smart dd, Alt+jk)
-- 7. LIMPIEZA Y CONFIGURACIÓN .......................... (Borrado de Teclas)
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
--                         1. ARCHIVOS Y NAVEGACIÓN                          --
-------------------------------------------------------------------------------

-- Buscar archivos (incluyendo ocultos e ignorados por git)
vim.keymap.set("n", "<leader>fa", function()
  Snacks.picker.files({ hidden = true, ignored = true })
end, { desc = "Find files including hidden and gitignored" })

-- Alternar entre el buffer actual y el anterior
vim.keymap.del("n", "<leader>.")
vim.keymap.set("n", "<leader>.", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Ver ruta absoluta del archivo actual (File Path)
vim.keymap.set("n", "<leader>fp", function()
  local path = vim.fn.expand("%:p")
  vim.notify(path, vim.log.levels.INFO, { title = "Ruta Absoluta" })
end, { desc = "Absolute File Path" })

-------------------------------------------------------------------------------
--                          2. GUARDADO INTELIGENTE                          --
-------------------------------------------------------------------------------

-- Comando y atajo para guardar con SUDO (usando Suda.vim)
vim.api.nvim_create_user_command("SW", function()
  vim.cmd("SudaWrite")
end, { desc = "Guardar con Suda" })

vim.keymap.set("n", "<leader>J", "<cmd>SW<cr>", { desc = "Save As Sudo" })

-- Función de guardado que pide nombre si el archivo es nuevo
local function smart_save()
  local filename = vim.api.nvim_buf_get_name(0)
  if filename == "" then
    vim.ui.input({ prompt = "Nombre para el nuevo archivo: " }, function(input)
      if input and input ~= "" then
        vim.cmd("write " .. input)
        vim.notify("Archivo guardado como: " .. input)
      end
    end)
  else
    vim.cmd("write")
  end
end

vim.keymap.set("n", "<leader>j", smart_save, { desc = "Smart Save (asks for name)" })

-- Cerrar todos los buffers
vim.keymap.set("n", "<leader>ba", "<cmd>%bd<cr>", { desc = "Delete all buffers" })

-------------------------------------------------------------------------------
--                                3. TERMINAL                                --
-------------------------------------------------------------------------------

local function smart_terminal_toggle(dir)
  local wins = vim.api.nvim_list_wins()
  for _, win in ipairs(wins) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == "terminal" then
      vim.api.nvim_win_close(win, true)
      return
    end
  end
  Snacks.terminal.toggle(nil, {
    cwd = dir,
    win = { position = "bottom", height = 12 },
  })
end

wk.add({
  { "<leader>t", group = "terminal", icon = "" },
  {
    "<leader>tt",
    function()
      smart_terminal_toggle(LazyVim.root())
    end,
    desc = "Toggle Terminal Root",
  },
  {
    "<leader>td",
    function()
      smart_terminal_toggle(vim.fn.expand("%:p:h"))
    end,
    desc = "Toggle Terminal Directory",
  },
})

-------------------------------------------------------------------------------
--                            4. SCRATCH BUFFERS                             --
-------------------------------------------------------------------------------

vim.keymap.del("n", "<leader>`")
vim.keymap.del("n", "<leader>,")

-- Abrir/Alternar scratch buffer rápido
vim.keymap.set("n", "<leader>,", function()
  Snacks.scratch()
end, { desc = "Toggle Scratch Buffer" })

-- Seleccionar un scratch existente de la lista
vim.keymap.set("n", "<leader>bs", function()
  Snacks.picker.scratch()
end, { desc = "Select Scratch Buffer" })

-- Crear un nuevo scratch de Markdown con nombre personalizado
vim.keymap.set("n", "<leader>bS", function()
  vim.ui.input({ prompt = "Nombre del Scratch: " }, function(input)
    if input and input ~= "" then
      Snacks.scratch.open({ name = input, ft = "markdown" })
      vim.schedule(function()
        vim.bo.filetype = "markdown"
      end)
    end
  end)
end, { desc = "Create New Markdown Scratch" })

-------------------------------------------------------------------------------
--                           5. EJECUCIÓN DE CÓDIGO                          --
-------------------------------------------------------------------------------

local runcode = require("utils.runcode")

wk.add({
  {
    "<leader>r",
    function()
      runcode.run_code()
    end,
    desc = "Run code",
    icon = "󰐊 ",
  },
})

-------------------------------------------------------------------------------
--                           6. EDICIÓN Y MOVIMIENTO                         --
-------------------------------------------------------------------------------

-- Silenciar avisos de cambios de línea (Evita spam en Alt+jk)
vim.opt.report = 999

-- Borrado 'x' y 'Del' al agujero negro (no copian)
vim.keymap.set({ "n", "v" }, "x", '"_x')
vim.keymap.set("n", "<Del>", '"_x')

-- Borrado inteligente 'dd': No copia líneas vacías
local function smart_dd()
  if vim.api.nvim_get_current_line():match("^%s*$") then
    return '"_dd'
  else
    return "dd"
  end
end
vim.keymap.set("n", "dd", smart_dd, { expr = true, desc = "Smart dd" })

-- Centrado automático al navegar
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Bajar media pantalla centrado" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Subir media pantalla centrado" })

-- Mover líneas y bloques (Alt + j/k) - Silencioso
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==<cmd>lua Snacks.notifier.hide()<cr>", { desc = "Mover línea abajo" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==<cmd>lua Snacks.notifier.hide()<cr>", { desc = "Mover línea arriba" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Mover bloque abajo", silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Mover bloque arriba", silent = true })

-- 1. Deshacer y volver al sitio exacto con 'gi'
vim.keymap.set("i", "<C-u>", "<Esc>ugi", { desc = "Undo y volver al sitio" })

-- 2. Rehacer (Redo): Tu idea de usar 'A' para saltar al final de la línea
vim.keymap.set("i", "<C-r>", "<Esc><C-r>A", { desc = "Redo y saltar al final de la línea" })

-- 3. EL TRUCO EXTRA: Puntos de control al escribir
vim.keymap.set("i", ".", ".<C-g>u")
vim.keymap.set("i", ",", ",<C-g>u")

-- Borrar la línea entera y dejarte listo para escribir
vim.keymap.set("i", "<C-l>", "<Esc>S", { desc = "Limpiar línea y seguir escribiendo" })

-- vim.keymap.set("i", "<C-l>", "<Esc>ddi", { desc = "Eliminar línea y subir el resto" })

-- 1. Yanky: Abrir el historial de copiado con Ctrl + y
-- Esto lanza el buscador de Telescope con todo tu historial de Yanky
vim.keymap.set("i", "<A-ñ>", "<cmd>YankyRingHistory<cr>", { desc = "Abrir historial de Yanky" })

-- 2. Registros: Acceder a los registros de Neovim con Alt + r
-- Reubicamos la función original de Ctrl + r (que ahora usas para Redo)
vim.keymap.set("i", "<A-r>", "<C-r>", { desc = "Insertar desde registro" })

-------------------------------------------------------------------------------
--                        7. LIMPIEZA Y CONFIGURACIÓN                        --
-------------------------------------------------------------------------------

-- Eliminar atajos de LazyVim que no usamos o estorban
local to_del = {
  "<leader>L",
  "<leader>l",
  "<leader>?",
  "<leader>K",
  "<leader>S",
  "<leader>dph",
  "<leader>dps",
  "<leader>dpp",
  "<leader>D",
}
for _, key in ipairs(to_del) do
  pcall(vim.keymap.del, "n", key)
end
