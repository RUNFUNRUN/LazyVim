return {
  {
    "saghen/blink.cmp",
    config = {
      keymap = {
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
      },
      completion = {
        list = { selection = "manual" },
        documentation = { window = { border = "rounded" } },
      },
    },
  },
}
