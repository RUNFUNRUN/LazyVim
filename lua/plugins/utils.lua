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
    opts = {
      timeout = 3,
      maxkeys = 5,
    },
    init = function()
      local showkeys = require("showkeys")

      local enable = false
      Snacks.toggle({
        name = "Showkeys",
        get = function()
          return enable
        end,
        set = function()
          showkeys.toggle()
          enable = not enable
        end,
      }):map("<leader>uk")
    end,
  },
}
