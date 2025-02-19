local autocmd = vim.api.nvim_create_autocmd

-- convert `bun.lockb` from bin to text
autocmd("BufReadCmd", {
  pattern = "bun.lockb",
  callback = function()
    local path = vim.fn.expand("%:p")
    local output = vim.fn.systemlist("bun " .. path)
    vim.api.nvim_buf_set_lines(0, 0, -1, true, output)
    vim.bo.filetype = "conf"
    vim.bo.readonly = true
    vim.bo.modifiable = false
  end,
})

-- load `bun.lock` as jsonc
autocmd("BufRead", {
  pattern = "bun.lock",
  callback = function()
    vim.bo.filetype = "jsonc"
    vim.bo.readonly = true
    vim.bo.modifiable = false
  end,
})

-- on Windows or WSL: When exiting Insert mode, disable the IME.
-- check here https://github.com/RUNFUNRUN/ime-toggle
if vim.env.DISPLAY and (vim.fn.has("wsl") or vim.fn.has("win32")) then
  autocmd("InsertLeave", {
    pattern = "*",
    callback = function()
      vim.fn.system("ime_toggle.exe en")
    end,
  })
end
