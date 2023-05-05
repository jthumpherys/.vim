return {
  {
    "neovim/nvim-lspconfig",
    name = "lspconfig",
    config = function()
      require("lspconfig")
      require("plugins.lsp.config").setup()
    end,
    dependencies = {
      "mason",
      "mason-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    event = { "BufReadPre", "BufNewFile" },
  },

  {
    "williamboman/mason.nvim",
    name = "mason",
    version = "*",
    lazy = false,
    config = true,
    build = ":MasonUpdate",
  },

  {
    "williamboman/mason-lspconfig.nvim",
    name = "mason-lspconfig",
    version = "*",
    opts = {
      automatic_installation = true,
    },
    dependencies = { "mason" },
  },
}
