local nvim_lsp = require("lspconfig")

local biome_filename = {
  "biome.json",
  "biome.jsonc",
}

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

local deno_filename = {
  "deno.json",
  "deno.jsonc",
}

local biome_root_dir = nvim_lsp.util.root_pattern(biome_filename)
local is_biome_repo = biome_root_dir(LazyVim.root.get()) ~= nil

local prettier_root_dir = nvim_lsp.util.root_pattern(prettier_filename)
local is_prettier_repo = prettier_root_dir(LazyVim.root.get()) ~= nil

local deno_root_dir = nvim_lsp.util.root_pattern(deno_filename)
local is_deno_repo = deno_root_dir(LazyVim.root.get()) ~= nil

if is_biome_repo then
  return {
    {
      "stevearc/conform.nvim",
      opts = {
        formatters_by_ft = {
          javascript = { "biome-check" },
          typescript = { "biome-check" },
          javascriptreact = { "biome-check" },
          typescriptreact = { "biome-check" },
          astro = { "biome-check" },
          svelte = { "biome-check" },
          vue = { "biome-check" },
          json = { "biome-check" },
          jsonc = { "biome-check" },
        },
      },
    },
  }
elseif is_prettier_repo then
  return {
    {
      "stevearc/conform.nvim",
      opts = {
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          astro = { "prettier" },
          svelte = { "prettier" },
          vue = { "prettier" },
          json = { "prettier" },
          jsonc = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
        },
      },
    },
  }
elseif is_deno_repo then
  return {
    {
      "stevearc/conform.nvim",
      opts = {
        formatters_by_ft = {
          javascript = { "deno_fmt" },
          typescript = { "deno_fmt" },
          javascriptreact = { "deno_fmt" },
          typescriptreact = { "deno_fmt" },
          astro = { "deno_fmt" },
          svelte = { "deno_fmt" },
          vue = { "deno_fmt" },
          json = { "deno_fmt" },
          jsonc = { "deno_fmt" },
          html = { "prettier" },
          css = { "deno_fmt" },
        },
      },
    },
  }
else
  return {}
end
