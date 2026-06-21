-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

---@diagnostic disable-next-line: undefined-global
local LazyVim = require("lazyvim.util")

-------------------------------------------------------------------------------
--                                  ÍNDICE                                   --
-------------------------------------------------------------------------------
-- 1. ARCHIVOS Y NAVEGACIÓN ............................. (Búsqueda, Rutas)
-- 2. GUARDADO INTELIGENTE .............................. (Sudo, Smart Save)
-- 3. TERMINAL .......................................... (Toggle Inteligente)
-- 4. SCRATCH BUFFERS ................................... (Markdown, Picker)
-- 5. EJECUCIÓN DE CÓDIGO ............................... (Run Code)
-- 6. EDICIÓN Y MOVIMIENTO .............................. (Smart dd, Alt+hjkl) 'e
-- 7. LIMPIEZA Y CONFIGURACIÓN .......................... (Borrado de Teclas)
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
--                         0. ZONA DE PRUEBAS                                --
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
--                         1. ARCHIVOS Y NAVEGACIÓN                          --
-------------------------------------------------------------------------------

-- Buscar archivos (incluyendo ocultos e ignorados por git)
vim.keymap.set("n", "<leader>fa", function()
  Snacks.picker.files({ hidden = true, ignored = true })
end, { desc = "Find files including hidden and gitignored" })

pcall(vim.keymap.del, "n", "<leader>fc")

-- Buscar archivos en toda la carpeta .config del sistema
vim.keymap.set("n", "<leader>fc", function()
  Snacks.picker.files({
    cwd = vim.fn.expand("~/.config"),
    hidden = true,
  })
end, { desc = "Buscar en toda la carpeta .config" })

vim.keymap.set("n", "<leader>fC", function()
  Snacks.picker.files({
    cwd = vim.fn.expand("~/.config/nvim"),
  })
end, { desc = "Buscar en la configuración de Neovim" })

vim.keymap.set("n", "<leader>fm", function()
  Snacks.picker.files({
    cwd = vim.fn.expand("/home/abraham/.mydotfiles/com.ml4w.dotfiles/.config"),
  })
end, { desc = "Buscar en config ML4W" })

vim.keymap.set("n", "<leader>fP", "<cmd>lua Snacks.picker.projects() <cr>", { desc = "Open Projects Menu" })

-- Alternar entre el buffer actual y el anterior
vim.keymap.set("n", "<leader>.", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

vim.keymap.set("n", "<leader>B", "<cmd>lua Snacks.picker.lines()<cr>", { desc = "Search Lines In Buffer" })

-- Ver ruta absoluta del archivo actual (File Path)
vim.keymap.set("n", "<leader>fp", function()
  local path = vim.fn.expand("%:p")
  vim.notify(path, vim.log.levels.INFO, { title = "Ruta Absoluta" })
end, { desc = "Absolute File Path" })

-- Go to Descargas
vim.keymap.set(
  "n",
  "<leader>Dd",
  "<cmd>cd ~/Descargas<cr><cmd>lua vim.notify(vim.fn.getcwd())<cr>",
  { desc = "Go to Descargas" }
)

-- Go to ML4W Config
vim.keymap.set(
  "n",
  "<leader>Dm",
  "<cmd>cd ~/.mydotfiles/com.ml4w.dotfiles/.config/<cr><cmd>lua vim.notify(vim.fn.getcwd())<cr>",
  { desc = "Go to ML4W Config" }
)

-- Go to Home (~)
vim.keymap.set("n", "<leader>Dh", "<cmd>cd ~<cr><cmd>lua vim.notify(vim.fn.getcwd())<cr>", { desc = "Go to Home (~)" })

-- Go to current file dir
vim.keymap.set(
  "n",
  "<leader>Df",
  "<cmd>cd %:p:h<cr><cmd>lua vim.notify(vim.fn.getcwd())<cr>",
  { desc = "Go to current file dir" }
)

-- Go to Config
vim.keymap.set(
  "n",
  "<leader>Dc",
  "<cmd>cd ~/.config<cr><cmd>lua vim.notify(vim.fn.getcwd())<cr>",
  { desc = "Go to Config" }
)

-- Go to /etc
vim.keymap.set("n", "<leader>De", "<cmd>cd /etc<cr><cmd>lua vim.notify(vim.fn.getcwd())<cr>", { desc = "Go to /etc" })

-- Where am I? (pwd)
vim.keymap.set("n", "<leader>Dp", "<cmd>lua vim.notify(vim.fn.getcwd())<cr>", { desc = "Where am I? (pwd)" })

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

-- BLINDAJE DE WHICH-KEY PARA LA TERMINAL
if not vim.g.vscode then
  local wk = require("which-key")
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
end

-------------------------------------------------------------------------------
--                               4. SCRATCH BUFFERS                          --
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
--                             5. EJECUCIÓN DE CÓDIGO                        --
-------------------------------------------------------------------------------

-- BLINDAJE PARA EJECUTAR CÓDIGO (Solo en Neovim nativo)
if not vim.g.vscode then
  local runcode = require("utils.runcode")
  local wk = require("which-key")
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
end

-------------------------------------------------------------------------------
--                             6. EDICIÓN Y MOVIMIENTO                       --
-------------------------------------------------------------------------------

-- 1. LIMPIEZA FORZOSA: Borramos los atajos rebeldes de Alt+j/k de LazyVim para que suelten el Alt
pcall(vim.keymap.del, "n", "<A-j>")
pcall(vim.keymap.del, "n", "<A-k>")
pcall(vim.keymap.del, "i", "<A-j>")
pcall(vim.keymap.del, "i", "<A-k>")
pcall(vim.keymap.del, "v", "<A-j>")
pcall(vim.keymap.del, "v", "<A-k>")

-- Borrar palabra entera hacia atrás con Ctrl + Backspace en modo insertar
vim.keymap.set("i", "<C-H>", "<C-w>", { desc = "Borrar palabra hacia atrás" })

-- Hacer que 'd' mande siempre al agujero negro (modo normal y visual)
vim.keymap.set({ "n" }, "d", '"_d', { remap = false, desc = "Delete without copy" })

-- Hacer que 'c' (cambiar) mande siempre al agujero negro
vim.keymap.set({ "n" }, "c", '"_c', { remap = false, desc = "Change without copy" })

-- 'XX' (dos veces Shift+x) corta la línea entera de verdad al portapapeles
vim.keymap.set("n", "XX", "dd", { remap = false, desc = "Operar cortando al portapapeles" })

-- 'X' en modo visual corta la selección entera de verdad al portapapeles
vim.keymap.set("v", "X", "d", { remap = false, desc = "Cortar selección al portapapeles" })

vim.opt.report = 999

-- Borrado 'x' y 'Del' al agujero negro (no copian)
vim.keymap.set({ "n", "v" }, "x", '"_x')
vim.keymap.set("n", "<Del>", '"_x')

-- La coma para saltar al bloque de código anterior (arriba)
vim.keymap.set("n", ",", "}", { remap = false, desc = "Saltar al bloque anterior" })
vim.keymap.set("v", ",", "}", { remap = false, desc = "Saltar al bloque anterior" })

-- El punto y coma para saltar al bloque de código siguiente (abajo)
vim.keymap.set("n", ";", "{", { remap = false, desc = "Saltar al bloque siguiente" })
vim.keymap.set("v", ";", "{", { remap = false, desc = "Saltar al bloque siguiente" })

-- 2. Modo Operador (Para que 'd,', 'd;', 'y,', 'y;' funcionen como '{}')
vim.keymap.set("o", ";", "{", { remap = false, desc = "Operar hasta el bloque anterior" })
vim.keymap.set("o", ",", "}", { remap = false, desc = "Operar hasta el bloque siguiente" })

-- Centrado automático al navegar
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Bajar media pantalla centrado" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Subir media pantalla centrado" })

-- SOLUCIÓN REAL: Mover líneas y bloques con Alt + Shift + j/k (A-J y A-K mayúsculas) - Silencioso
vim.keymap.set("n", "<A-J>", "<cmd>m .+1<cr>==<cmd>lua Snacks.notifier.hide()<cr>", { desc = "Mover línea abajo" })
vim.keymap.set("n", "<A-K>", "<cmd>m .-2<cr>==<cmd>lua Snacks.notifier.hide()<cr>", { desc = "Mover línea arriba" })
vim.keymap.set("v", "<A-J>", ":m '>+1<cr>gv=gv", { desc = "Mover bloque abajo", silent = true })
vim.keymap.set("v", "<A-K>", ":m '<-2<cr>gv=gv", { desc = "Mover bloque arriba", silent = true })

-- TU SUEÑO: Moverse en modo insertar con ALT + hjkl (Funcionando perfecto)
vim.keymap.set("i", "<A-h>", "<Left>", { desc = "Mover cursor a la izquierda" })
vim.keymap.set("i", "<A-j>", "<Down>", { desc = "Mover cursor abajo" })
vim.keymap.set("i", "<A-k>", "<Up>", { desc = "Mover cursor arriba" })
vim.keymap.set("i", "<A-l>", "<Right>", { desc = "Mover cursor a la derecha" })

-- Deshacer y volver al sitio exacto con 'gi'
vim.keymap.set("i", "<C-u>", "<Esc>ugi", { desc = "Undo y volver al sitio" })

-- Rehacer (Redo) y saltar al final de la línea
vim.keymap.set("i", "<C-r>", "<Esc><C-r>A", { desc = "Redo y saltar al final de la línea" })

-- Puntos de control al escribir (Crea cortes para el deshacer)
vim.keymap.set("i", ".", ".<C-g>u")
vim.keymap.set("i", ",", ",<C-g>u")

-- Borrar la línea entera en modo insertar y dejarte listo para escribir
vim.keymap.set("i", "<C-l>", "<Esc>S", { desc = "Limpiar línea y seguir escribiendo" })

-- Yanky: Abrir el historial de copiado con ventana de PREVIEW usando Ctrl + y
vim.keymap.set("i", "<C-y>", function()
  ---@diagnostic disable-next-line: undefined-field
  Snacks.picker.yanky()
end, { desc = "Historial Yanky (con Preview)" })

-- Registros: Acceder a los registros de Neovim con Alt + r
vim.keymap.set("i", "<A-r>", "<C-r>", { desc = "Insertar desde registro" })

-- Pegar texto abajo del cursor con la indentación correcta usando leader z
vim.keymap.set("n", "<leader>P", '"+]p', { remap = true, desc = "Pegar externo abajo indentado" })

-- Pegar el último yank en modo Normal (fuerza el uso nativo de "0p)
vim.keymap.set("n", "<leader>y", '"0p', { remap = false, desc = "Paste Last Yanked" })

-- Pegar el último yank en modo Visual (para machacar texto seleccionado sin pisar el portapapeles)
vim.keymap.set("v", "<leader>y", '"0p', { remap = false, desc = "Paste Last Yanked" })

-- Ctrl+p en modo insertar emula tus dedos pegando abajo indentado con remap
vim.keymap.set("i", "<C-p>", "<C-o>P", { remap = true, desc = "Pegar externo abajo en modo insertar" })

-- Generar clase de Java con método Main usando <leader>cj en modo normal
vim.keymap.set("n", "<leader>cj", function()
  -- 1. Miramos el nombre del archivo actual sin la extensión .java
  local filename = vim.fn.expand("%:t:r")
  if filename == "" then
    filename = "Main"
  end

  -- 2. Creamos la plantilla limpia con el main dentro
  local estructura = {
    "public class " .. filename .. " {",
    "    public static void main(String[] args) {",
    "     ",
    "  }",
    "}",
  }

  -- 3. Inyectamos las líneas en el buffer actual
  vim.api.nvim_buf_set_lines(0, 0, -1, false, estructura)

  -- 4. Movemos el cursor automáticamente a la línea 3 para que empieces a picar código
  vim.api.nvim_win_set_cursor(0, { 3, 8 })

  -- 5. Entramos automáticamente en modo insertar para ahorrarte pulsar la 'i'
  vim.cmd("startinsert")
end, { desc = "Generar estructura Java con Main" })

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
}
for _, key in ipairs(to_del) do
  pcall(vim.keymap.del, "n", key)
end

-------------------------------------------------------------------------------
--                         8. RANDOMADAS QUE ESTÁ BIEN RECORDAR               --
-------------------------------------------------------------------------------

-- Ahora , se mueve al siguiente párrafo y ; al anteriror, muy útil eso
-- Usa las marcas, con ma y luego 'a
