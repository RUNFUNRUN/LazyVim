return {
  -- additional setting
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- options for vim.diagnostic.config()
      ---@type vim.diagnostic.Opts
      inlay_hints = {
        enabled = false,
      },
      ---@type lspconfig.options
      servers = {
        pyright = {},
        emmet_ls = {
          filetypes = {
            "css",
            "html",
            "javascriptreact",
            "typescriptreact",
            "astro",
            "svelte",
            "vue",
            "less",
            "sass",
            "scss",
            "pug",
          },
        },
      },
    },
  },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "css",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "rust",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "biome",
        "prettier",
        "eslint-lsp",
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "google-java-format",
        "deno",
      },
    },
  },
}
