local tags = {
  "a",
  "article",
  "aside",
  "body",
  "button",
  "div",
  "footer",
  "form",
  "h1",
  "h2",
  "h3",
  "h4",
  "h5",
  "h6",
  "header",
  "html",
  "img",
  "input",
  "label",
  "li",
  "main",
  "nav",
  "ol",
  "p",
  "section",
  "select",
  "span",
  "table",
  "td",
  "textarea",
  "th",
  "tr",
  "ul",
}

local M = {}

function M.new()
  return setmetatable({}, { __index = M })
end

-- Dentro de un bloque según treesitter
local function inside_by_treesitter()
  local ok, parser = pcall(vim.treesitter.get_parser, 0, "css")
  if not ok or not parser then
    return false
  end
  parser:parse()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local node = vim.treesitter.get_node({ bufnr = 0, pos = { row - 1, math.max(col - 1, 0) } })
  while node do
    if node:type() == "block" then
      return true
    end
    node = node:parent()
  end
  return false
end

-- Dentro de llaves según conteo de { y } (ignorando comentarios)
local function inside_by_count()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local lines = vim.api.nvim_buf_get_text(0, 0, 0, row - 1, col, {})
  local text = table.concat(lines, "\n"):gsub("/%*.-%*/", "")
  local _, opens = text:gsub("{", "")
  local _, closes = text:gsub("}", "")
  return opens > closes
end

-- true SOLO si estamos seguros de que el cursor está fuera de llaves
function M.outside_braces()
  local _, col = unpack(vim.api.nvim_win_get_cursor(0))
  local before = vim.api.nvim_get_current_line():sub(1, col)
  -- escribiendo "propiedad: valor" -> dentro
  if before:find(":%s") then
    return false
  end
  if inside_by_treesitter() or inside_by_count() then
    return false
  end
  return true
end

function M:enabled()
  return vim.bo.filetype == "css" and M.outside_braces()
end

function M:get_completions(_, callback)
  local items = {}
  for _, t in ipairs(tags) do
    items[#items + 1] = {
      label = t,
      kind = require("blink.cmp.types").CompletionItemKind.Snippet,
      insertTextFormat = vim.lsp.protocol.InsertTextFormat.Snippet,
      insertText = t .. " {\n\t$0\n}",
    }
  end
  callback({
    items = items,
    is_incomplete_forward = false,
    is_incomplete_backward = false,
  })
  return function() end
end

return M
