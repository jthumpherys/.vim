local M = {}

function M.config_function()
  local default_server_options = {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  }
  default_server_options.capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  local lspconfig = require("lspconfig")
  local servers = require("plugins.lsp.language_servers")
  for server_name, server_opts in pairs(servers.language_servers) do
    server_opts = vim.tbl_deep_extend("keep", server_opts, default_server_options)
    lspconfig[server_name].setup(server_opts)
  end
end

function M.null_config_function(_, opts)
  local mason = require("mason-registry")
  local packages = require("plugins.lsp.null")
  for _, pkg in pairs(packages.package_installation_list) do
    if not mason.is_installed(pkg) then
      vim.cmd { cmd = "MasonInstall", args = { pkg } }
    end
  end

  opts.sources = packages.get_sources()
  require("null-ls").setup(opts)
end

return M
