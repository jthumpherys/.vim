return {
  {
    "neovim/nvim-lspconfig",
    name = "lspconfig",
    -- version = "*",
    config = function()
      require("lspconfig")
      require("plugins.lsp.config").setup()
    end,
    dependencies = {
      "mason",
      "mason-lspconfig",
      "hrsh7th/cmp-nvim-lsp"
    },
    event = { "BufReadPre", "BufNewFile" },
  },

  {
    "williamboman/mason.nvim",
    name = "mason",
    version = "*",
    lazy = false,
    opts = {
      ensure_installed = require("plugins.linting.config").packages,
    },
    config = true,
    build = ":MasonUpdate",
  },

  {
    "williamboman/mason-lspconfig.nvim",
    name = "mason-lspconfig",
    version = "*",
    opts = {
      -- ensure_installed = require("plugins.lsp.config").servers,
      automatic_installation = true,
    },
    dependencies = { "mason", "null-ls" },
  },
}
