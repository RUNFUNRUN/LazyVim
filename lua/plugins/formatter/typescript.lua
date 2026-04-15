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

local oxfmt_filename = {
  "oxfmt.config.ts",
  ".oxfmtrc.jsonc",
  ".oxfmtrc.json",
}

local biome_root_dir = nvim_lsp.util.root_pattern(biome_filename)
local is_biome_repo = biome_root_dir(LazyVim.root.get()) ~= nil

local prettier_root_dir = nvim_lsp.util.root_pattern(prettier_filename)
local is_prettier_repo = prettier_root_dir(LazyVim.root.get()) ~= nil

local deno_root_dir = nvim_lsp.util.root_pattern(deno_filename)
local is_deno_repo = deno_root_dir(LazyVim.root.get()) ~= nil

local oxfmt_root_dir = nvim_lsp.util.root_pattern(oxfmt_filename)
local is_oxfmt_repo = oxfmt_root_dir(LazyVim.root.get()) ~= nil

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
          graphql = { "biome-check" },
          html = { "biome-check" },
          css = { "biome-check" },
        },
      },
    },
  }
end

if is_prettier_repo then
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
          angular = { "prettier" },
          svelte = { "prettier" },
          vue = { "prettier" },
          json = { "prettier" },
          jsonc = { "prettier" },
          graphql = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
          less = { "prettier" },
          scss = { "prettier" },
        },
      },
    },
  }
end

if is_deno_repo then
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
          angular = { "deno_fmt" },
          svelte = { "deno_fmt" },
          vue = { "deno_fmt" },
          json = { "deno_fmt" },
          jsonc = { "deno_fmt" },
          html = { "deno_fmt" },
          css = { "deno_fmt" },
          scss = { "deno_fmt" },
          sass = { "deno_fmt" },
          less = { "deno_fmt" },
          yaml = { "deno_fmt" },
        },
      },
    },
  }
end

if is_oxfmt_repo then
  return {
    {
      "stevearc/conform.nvim",
      opts = {
        formatters_by_ft = {
          javascript = { "oxfmt" },
          typescript = { "oxfmt" },
          javascriptreact = { "oxfmt" },
          typescriptreact = { "oxfmt" },
          astro = { "oxfmt" },
          angular = { "oxfmt" },
          svelte = { "oxfmt" },
          vue = { "oxfmt" },
          json = { "oxfmt" },
          jsonc = { "oxfmt" },
          json5 = { "oxfmt" },
          html = { "oxfmt" },
          css = { "oxfmt" },
          scss = { "oxfmt" },
          sass = { "oxfmt" },
          less = { "oxfmt" },
          yaml = { "oxfmt" },
          toml = { "oxfmt" },
          markdown = { "oxfmt" },
          ["markdown.mdx"] = { "oxfmt" },
          graphql = { "oxfmt" },
          handlebars = { "oxfmt" },
          ember = { "oxfmt" },
        },
      },
    },
  }
end

return {}
