-- only kitty terminal
-- check here: https://github.com/3rd/image.nvim
if os.getenv("KITTY_WINDOW_ID") == nil then
  return {}
end

-- do not load on commit message
if vim.fn.expand("%:t") == "COMMIT_EDITMSG" then
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
    init = function()
      require("image").setup()
    end,
  },
}
