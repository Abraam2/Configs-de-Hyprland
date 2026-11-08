local function in_comment()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  row = row - 1
  -- carácter anterior al cursor (el que acabas de escribir)
  if col > 0 then
    col = col - 1
  end

  -- fuerza a treesitter a reparsear lo que acabas de teclear
  local ok, parser = pcall(vim.treesitter.get_parser, 0)
  if ok and parser then
    pcall(function()
      parser:parse(true)
    end)
  end

  local ok2, res = pcall(vim.inspect_pos, 0, row, col)
  if not ok2 or not res then
    return false
  end

  for _, t in ipairs(res.treesitter or {}) do
    if t.capture and t.capture:find("comment") then
      return true
    end
  end
  for _, s in ipairs(res.syntax or {}) do
    if s.hl_group and s.hl_group:lower():find("comment") then
      return true
    end
  end
  return false
end

return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    local original_enabled = opts.enabled

    opts.enabled = function()
      if original_enabled then
        if not original_enabled() then
          return false
        end
      elseif vim.bo.buftype == "prompt" or vim.b.completion == false then
        return false
      end
      return not in_comment()
    end
  end,
}
