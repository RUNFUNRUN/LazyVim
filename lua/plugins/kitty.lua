-- only kitty terminal
-- check here: https://github.com/3rd/image.nvim
if vim.fn.getenv("KITTY_WINDOW_ID") ~= nil then
  return {}
end

return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1001,
    opts = {
      rocks = { "magick" },
    },
  },
  {
    "3rd/image.nvim",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("image").setup()
    end,
  },
}
