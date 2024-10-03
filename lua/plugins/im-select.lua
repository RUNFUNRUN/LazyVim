return {
  {
    "keaising/im-select.nvim",
    init = function()
      if (not vim.env.SSH_TTY) and vim.env.DISPLAY then
        require("im_select").setup()

        if vim.fn.has("wsl") or vim.fn.has("win32") then
          vim.api.nvim_create_autocmd("VimLeave", {
            callback = function()
              vim.fn.system("im-select.exe 1041")
            end,
          })
          vim.api.nvim_create_autocmd("FocusLost", {
            callback = function()
              vim.fn.system("im-select.exe 1041")
            end,
          })
        end
      end
    end,
  },
}
