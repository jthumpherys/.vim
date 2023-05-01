local M = {}

M.servers = {
  -- arduino_language_server = {},
  bashls = {},
  clangd = {},
  -- dartls = {},
  -- hls = {},
  -- julials = {},
  -- kotlin_language_server = {},
  lua_ls = {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = {"vim"},
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true)
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
  marksman = {},
  pylsp = {
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            ignore = {"E501"},
            maxLineLength = 90,
          },
        },
      },
    },
  },
  -- rust_analyzer = {},
  vimls = {},
  -- zk = {},
}


function M.setup()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
  for server_name, server_opts in pairs(M.servers) do
    server_opts.capabilities = capabilities
    require("lspconfig")[server_name].setup(server_opts)
  end
end

return M
