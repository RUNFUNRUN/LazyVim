-- only kitty terminal
-- check here: https://github.com/3rd/image.nvim
if os.getenv("KITTY_WINDOW_ID") == nil then
  return {}
end

return {
  {
    "3rd/image.nvim",
    config = function()
      require("image").setup()
    end,
  },
}
