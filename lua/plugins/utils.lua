return {
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
