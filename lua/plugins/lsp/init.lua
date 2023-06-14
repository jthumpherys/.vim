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
    config = function()
      local lspconfig = require("lspconfig")
      local config = require("plugins.lsp.config")
      for server_name, server_opts in pairs(config.lsp_servers) do
        if server_opts.capabilities == nil then
          server_opts.capabilities = config.defaults.capabilities
        end
        lspconfig[server_name].setup(server_opts)
      end
    end,
    dependencies = {
      "mason",
      "mason-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      { "folke/neodev.nvim", config = true },
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
    opts = { automatic_installation = true },
    version = "*",
    dependencies = { "mason" },
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    name = "null-ls",
    config = function()
      local config = require("plugins.lsp.config")
      local mason = require("mason-registry")
      for _, pkg in pairs(config.null_installs) do
        if not mason.is_installed(pkg) then
          vim.cmd { cmd = "MasonInstall", args = { pkg } }
        end
      end
      require("null-ls").setup(config.get_null_options())
    end,
    dependencies = { "plenary", "mason" },
    ft = require("plugins.lsp.config").null_filetypes,
  },
}
