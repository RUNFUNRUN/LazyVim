local autocmd = vim.api.nvim_create_autocmd

-- convert `bun.lockb` from bin to text
autocmd("BufReadCmd", {
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
