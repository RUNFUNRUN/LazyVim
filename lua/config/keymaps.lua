local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<Esc><Esc>", "<Cmd>nohlsearch<CR>", opts)
map("n", "+", "<C-a>", opts)
map("n", "-", "<C-x>", opts)
map("n", "<C-a>", "gg<S-v>G", opts)
map("n", "x", '"_x', opts)
-- don't store a blank line in registers
map("n", "dd", function()
  local line = vim.api.nvim_get_current_line()
  if string.match(line, "^%s*$") then
    vim.cmd('normal! "_dd')
  else
    vim.cmd("normal! dd")
  end
end, opts)

map("i", "jj", "<Esc>", opts)
-- converts the last word entered to uppercase
map("i", "<C-l>", function()
  local line = vim.fn.getline(".")
  local col = vim.fn.getpos(".")[3]
  local substring = line:sub(1, col - 1)
  local result = vim.fn.matchstr(substring, [[\v<(\k(<)@!)*$]])
  return "<C-w>" .. result:upper()
end, { expr = true })

map("x", "p", "P", opts)
map("x", "P", "p", opts)
-- don't store blank lines in registers
map("x", "d", function()
  local mode = vim.fn.visualmode()

  local start = vim.api.nvim_buf_get_mark(0, "<")
  local finish = vim.api.nvim_buf_get_mark(0, ">")
  if
    start[1] > finish[1] or (start[1] == finish[1] and start[2] > finish[2])
  then
    start, finish = finish, start
  end

  local selection_text = ""
  if mode == "V" then
    local lines = vim.api.nvim_buf_get_lines(0, start[1] - 1, finish[1], false)
    selection_text = table.concat(lines, "\n")
  elseif mode == "v" then
    local lines = vim.api.nvim_buf_get_lines(0, start[1] - 1, finish[1], false)
    if #lines == 0 then
      return
    end
    if #lines == 1 then
      selection_text = lines[1]:sub(start[2] + 1, finish[2] + 1)
    else
      local parts = {}
      table.insert(parts, lines[1]:sub(start[2] + 1))
      for i = 2, #lines - 1 do
        table.insert(parts, lines[i])
      end
      table.insert(parts, lines[#lines]:sub(1, finish[2] + 1))
      selection_text = table.concat(parts, "\n")
    end
  else
    local lines = vim.api.nvim_buf_get_lines(0, start[1] - 1, finish[1], false)
    selection_text = table.concat(lines, "\n")
  end

  if selection_text:match("^%s*$") then
    vim.cmd('normal! "_d')
  else
    vim.cmd("normal! d")
  end
end, opts)
