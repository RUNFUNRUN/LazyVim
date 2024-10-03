return {
  {
    "keaising/im-select.nvim",
    init = function()
      if not vim.env.SSH_TTY then
        require("im_select").setup()
      end
    end,
  },
}
