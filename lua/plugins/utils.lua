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
  -- show key inputs in neovim
  {
    "nvzone/showkeys",
    dependencies = { "folke/snacks.nvim" },
    cmd = "ShowkeysToggle",
    opts = {
      timeout = 3,
      maxkeys = 5,
    },
    init = function(opts)
      require("showkeys").setup(opts)

      local state = false
      Snacks.toggle({
        name = "Showkeys",
        get = function()
          return state
        end,
        set = function()
          require("showkeys").toggle()
          state = not state
        end,
      }):map("<leader>uk")
    end,
  },
}
