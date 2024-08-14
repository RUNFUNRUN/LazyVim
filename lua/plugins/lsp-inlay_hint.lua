return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      ---@type vim.diagnostic.Opts
      inlay_hints = {
        enabled = false,
      },
    },
  },
}
