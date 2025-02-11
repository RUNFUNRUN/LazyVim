if vim.fn.has("macunix") ~= 1 then
  return {}
end

return {
  {
    "keaising/im-select.nvim",
    init = function()
      require("im_select").setup()
    end,
  },
}
