return {
  {
    "neovim/nvim-lspconfig",
    name = "lspconfig",
    init = function()
      -- disable lsp watcher, apparently it's slow on linux? idk what it is
      local ok, wf = pcall(require, "vim.lsp._watchfiles")
      if ok then
        wf._watchfunc = function()
          return function() end
        end
      end
    end,
    config = require("plugins.lsp.config").config_function,
    dependencies = {
      "mason",
      "mason-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      { "folke/neodev.nvim", config = true },
      "goto-preview",
    },
    event = { "BufReadPre", "BufNewFile" },
  },

  {
    "rmagatti/goto-preview",
    name = "goto-preview",
    opts = function()
      local ok, module = pcall(require, "plugins.lsp.local")
      if ok then return module.goto_preview_opts else return {} end
    end,
    config = true,
  },

  {
    "williamboman/mason.nvim",
    name = "mason",
    version = "*",
    lazy = false,
    config = function()
      require("mason").setup()
      local reg = require("mason-registry")
      reg.refresh()
      reg.update()
    end,
    build = ":MasonUpdate",
  },

  {
    "williamboman/mason-lspconfig.nvim",
    name = "mason-lspconfig",
    opts = {
      automatic_installation = true,
    },
    config = true,
    version = "*",
    dependencies = { "mason" },
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    name = "null-ls",
    opts = {
      diagnostics_format = "[#{s}] #{m} (#{c})",
    },
    config = require("plugins.lsp.config").null_config_function,
    dependencies = { "plenary", "mason", "lspconfig" },
    -- event = { "BufReadPre", "BufNewFile" },
    ft = require("plugins.lsp.null").filetypes,
  },
}
