function TableConcat(...)
  local result = {}

  for _, tbl in ipairs({ ... }) do
    for _, value in ipairs(tbl) do
      table.insert(result, value)
    end
  end

  return result
end

function DeleteLine()
  local line = vim.api.nvim_get_current_line()
  if string.match(line, "^%s*$") then
    vim.cmd('normal! "_dd')
  else
    vim.cmd("normal! dd")
  end
end

function DeleteBlock()
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  local lines = vim.fn.getline(start_line, end_line)
  if type(lines) == "string" then
    lines = { lines }
  end
  local all_blank = true
  for _, line in ipairs(lines) do
    if not line:match("^%s*$") then
      all_blank = false
      break
    end
  end
  if all_blank then
    vim.cmd('normal! "_d')
  else
    vim.cmd("normal! d")
  end
end
