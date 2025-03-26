return {
  -- better diagnostics
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
      vim.diagnostic.config({ virtual_text = false })
      require("tiny-inline-diagnostic").setup({
        preset = "powerline",
        options = {
          multilines = {
            enabled = true,
            always_show = true,
          },
          show_source = true,
        },
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
    lazy = false,
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
      Snacks.toggle({
        name = "Showkeys",
        get = function()
          return require("showkeys.state").visible
        end,
        set = function()
          showkeys.toggle()
        end,
      }):map("<leader>uk")
    end,
  },
  -- practice typing
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {
      mode = "phrases",
    },
    cmd = { "Typr", "TyprStats" },
  },
}
