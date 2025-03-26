local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<Esc><Esc>", "<Cmd>nohlsearch<CR>", opts)
map("n", "+", "<C-a>", opts)
map("n", "-", "<C-x>", opts)
map("n", "<C-a>", "gg<S-v>G", opts)
map("n", "x", '"_x', opts)

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
