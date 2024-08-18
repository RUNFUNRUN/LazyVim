function DeleteLine()
  local line = vim.api.nvim_get_current_line()
  if string.match(line, "^%s*$") then
    vim.api.nvim_command('normal! "_dd')
  else
    vim.api.nvim_command("normal! dd")
  end
end

function TableConcat(...)
  local result = {}

  for _, tbl in ipairs({ ... }) do
    for _, value in ipairs(tbl) do
      table.insert(result, value)
    end
  end

  return result
end
