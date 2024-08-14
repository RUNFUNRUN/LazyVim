local biome_filename = {
  "biome.json",
  "biome.jsonc",
}

local nvim_lsp = require("lspconfig")

local biome_root_dir = nvim_lsp.util.root_pattern(biome_filename)
local is_biome_repo = biome_root_dir(vim.api.nvim_buf_get_name(0)) ~= nil

local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "biome",
      },
    },
  },
}

if is_biome_repo then
  table.insert(plugins, {
    {
      "stevearc/conform.nvim",
      opts = {
        formatters_by_ft = {
          ["javascript"] = { "biome" },
          ["typescript"] = { "biome" },
          ["javascriptreact"] = { "biome" },
          ["typescriptreact"] = { "biome" },
          ["astro"] = { "biome" },
          ["svelte"] = { "biome" },
          ["vue"] = { "biome" },
          ["json"] = { "biome" },
          ["jsonc"] = { "biome" },
          ["css"] = { "biome" },
        },
      },
    },
  })
end

return plugins
