-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<Esc><Esc>", "<Cmd>nohlsearch<CR>", opts)
map("n", "+", "<C-a>", opts)
map("n", "-", "<C-x>", opts)
map("n", "<C-a>", "gg<S-v>G", opts)
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
end, opts)
