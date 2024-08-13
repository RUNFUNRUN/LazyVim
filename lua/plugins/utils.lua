return {
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require("nvim-highlight-colors").setup({
        enable_tailwind = true,
      })
    end,
  },
  {
    "uga-rosa/ccc.nvim",
    config = function()
      require("ccc").setup()
    end,
  },
  {
    "vuki656/package-info.nvim",
    config = function()
      require("package-info").setup()
    end,
  },
  -- discord rich presence
  -- check here: https://github.com/andweeb/presence.nvim
  {
    "andweeb/presence.nvim",
    config = function()
      require("presence").setup({})
    end,
  },
}
