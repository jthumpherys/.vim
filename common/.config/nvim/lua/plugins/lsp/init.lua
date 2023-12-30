return {
  {
    "neovim/nvim-lspconfig",
    name = "lspconfig",
    config = function()
      local servers = require("plugins.lsp.language_servers")
      for server_name, server_opts in pairs(servers.language_servers) do
        vim.tbl_deep_extend("keep", server_opts, servers.default_opts)
        require("lspconfig")[server_name].setup(server_opts)
      end
    end,
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        opts = { automatic_installation = true },
        config = true,
        dependencies = { "mason" },
      },
    },
    event = { "BufReadPre", "BufNewFile" },
  },

  {
    "williamboman/mason.nvim",
    name = "mason",
    build = ":MasonUpdate",
    config = true,
    cmd = { "Mason", "MasonUpdate", "MasonInstall", "MasonUninstall" },
  },

  {
    "rmagatti/goto-preview",
    name = "goto-preview",
    -- opts = function()
    --   local ok, module = pcall(require, "plugins.lsp.local")
    --   if ok then return module.goto_preview_opts else return {} end
    -- end,
    config = true,
  },
}
