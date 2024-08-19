return {
  -- highlight color
  {
    "brenoprata10/nvim-highlight-colors",
    init = function()
      require("nvim-highlight-colors").setup({
        enable_tailwind = true,
      })
    end,
  },
  -- color picker
  {
    "uga-rosa/ccc.nvim",
    init = function()
      require("ccc").setup()
    end,
  },
  -- discord rich presence
  {
    "andweeb/presence.nvim",
    init = function()
      require("presence").setup({})
    end,
  },
}
