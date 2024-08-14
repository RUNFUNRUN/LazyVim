return {
  -- color picker
  {
    "uga-rosa/ccc.nvim",
    config = function()
      require("ccc").setup()
    end,
  },
  -- discord rich presence
  {
    "andweeb/presence.nvim",
    config = function()
      require("presence").setup({})
    end,
  },
}
