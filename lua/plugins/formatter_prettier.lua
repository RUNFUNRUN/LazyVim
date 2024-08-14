local prettier_filename = {
  ".prettierrc",
  ".prettierrc.json",
  ".prettierrc.json5",
  ".prettierrc.yaml",
  ".prettierrc.yml",
  ".prettierrc.toml",
  ".prettierrc.js",
  ".prettierrc.cjs",
  ".prettierrc.mjs",
  "prettier.config.js",
  "prettier.config.cjs",
  "prettier.config.mjs",
}

local nvim_lsp = require("lspconfig")

local prettier_root_dir = nvim_lsp.util.root_pattern(prettier_filename)
local is_prettier_repo = prettier_root_dir(vim.api.nvim_buf_get_name(0)) ~= nil

local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettier",
      },
    },
  },
}

if is_prettier_repo then
  table.insert(plugins, {
    {
      "stevearc/conform.nvim",
      opts = {
        formatters_by_ft = {
          ["javascript"] = { "prettier" },
          ["typescript"] = { "prettier" },
          ["javascriptreact"] = { "prettier" },
          ["typescriptreact"] = { "prettier" },
          ["astro"] = { "prettier" },
          ["svelte"] = { "prettier" },
          ["vue"] = { "prettier" },
          ["json"] = { "prettier" },
          ["jsonc"] = { "prettier" },
          ["css"] = { "prettier" },
        },
      },
    },
  })
end

return plugins
