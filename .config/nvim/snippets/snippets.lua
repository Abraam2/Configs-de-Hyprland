local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Función para añadir el import arriba si no existe
local function add_import(import_path)
  return f(function()
    local bufnr = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    for _, line in ipairs(lines) do
      if line:find(import_path) then
        return ""
      end
    end
    vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, { "import " .. import_path .. ";" })
    return ""
  end)
end

ls.add_snippets("java", {
  s("arraylist", {
    add_import("java.util.ArrayList"),
    t("var "),
    i(1, "nombre"),
    t(" = new ArrayList<"),
    i(2, "Tipo"),
    t(">();"),
  }),
})
