if not vim.g.vscode then
  return {}
end

return {
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "mode" },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
      })
    end,
  },
}
