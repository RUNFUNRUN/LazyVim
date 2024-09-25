-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- apply mdx filetype
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.mdx",
  command = "set filetype=markdown.mdx",
})

-- convert `bun.lockb` from bin to text
vim.api.nvim_create_autocmd("BufReadCmd", {
  pattern = "bun.lockb",
  callback = function()
    local path = vim.fn.expand("%:p")
    local output = vim.fn.systemlist("bun " .. path)
    vim.api.nvim_buf_set_lines(0, 0, -1, true, output)
    vim.opt_local.filetype = "conf"
    vim.opt_local.readonly = true
    vim.opt_local.modifiable = false
  end,
})
