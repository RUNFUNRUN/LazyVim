-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
require("utils")

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("i", "jj", "<Esc>", opts)
map("n", "<Esc><Esc>", "<Cmd>nohlsearch<CR>", opts)
map("n", "+", "<C-a>", opts)
map("n", "-", "<C-x>", opts)
map("n", "<C-a>", "gg<S-v>G", opts)
map("n", "<Enter>", "o<Esc>", opts)
map("n", "<S-Enter>", "O<Esc>", opts)

vim.api.nvim_set_keymap("n", "dd", "<Cmd>lua DeleteLine()<CR>", opts)
