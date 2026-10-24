local M = {}

local function root_of(file)
  return vim.fs.root(file, { ".live", "index.html" }) or vim.fs.dirname(file)
end

local function port_free(port)
  local tcp = vim.uv.new_tcp()
  if not tcp then
    return false
  end
  local ok = tcp:bind("127.0.0.1", port)
  tcp:close()
  return ok ~= nil
end

-- ¿ya hay un live-server nuestro sirviendo esta raíz en este puerto?
local function is_ours(port, root)
  local esc = root:gsub("[%.%+%*%?%[%]%(%)%^%$|\\{}]", "\\%0")
  vim.fn.system({ "pgrep", "-f", ("live-server.*--port=%d .*%s"):format(port, esc) })
  return vim.v.shell_error == 0
end

-- puerto base estable por proyecto; si está ocupado por otra cosa, prueba el siguiente
local function find_port(root)
  local base = tonumber(vim.fn.sha256(root):sub(1, 6), 16) % 1000 + 5500
  for i = 0, 50 do
    local port = base + i
    if is_ours(port, root) then
      return port, true
    end
    if port_free(port) then
      return port, false
    end
  end
end

function M.open()
  if vim.fn.executable("live-server") == 0 then
    return vim.notify("Falta live-server (npm i -g live-server)", vim.log.levels.ERROR)
  end

  local file = vim.api.nvim_buf_get_name(0)
  if file == "" then
    return vim.notify("Este buffer no tiene archivo", vim.log.levels.WARN)
  end

  local root = root_of(file)
  local port, running = find_port(root)
  if not port then
    return vim.notify("No encuentro puerto libre", vim.log.levels.ERROR)
  end

  if not running then
    local id = vim.fn.jobstart({
      "live-server",
      "--port=" .. port,
      "--host=127.0.0.1",
      "--no-browser",
      "--ignorePattern=node_modules",
      root,
    }, { detach = true })
    if id <= 0 then
      return vim.notify("No se pudo arrancar live-server", vim.log.levels.ERROR)
    end
  end

  local rel = file:sub(#root + 2):gsub(" ", "%%20")
  local url = ("http://127.0.0.1:%d/%s"):format(port, rel)

  vim.defer_fn(function()
    vim.ui.open(url)
  end, running and 0 or 700)
  vim.notify("Live: " .. url .. "\nRaíz: " .. root)
end

-- como ya no depende de Neovim, parar = matar todos los live-server
function M.stop()
  vim.fn.system({ "pkill", "-f", "live-server" })
  vim.notify("Live servers detenidos")
end

return M
