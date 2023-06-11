local M = {}

M.servers = {
  -- arduino_language_server = {},
  -- bashls = {},
  -- clangd = {},
  -- dartls = {},
  -- hls = {},
  -- julials = {},
  -- kotlin_language_server = {},
  -- lua_ls = {
  --   settings = {
  --     Lua = {
  --       runtime = {
  --         version = "LuaJIT",
  --       },
  --       diagnostics = {
  --         globals = {"vim"},
  --       },
  --       workspace = {
  --         library = vim.api.nvim_get_runtime_file("", true)
  --       },
  --       telemetry = {
  --         enable = false,
  --       },
  --     },
  --   },
  -- },
  -- marksman = {},
  pylsp = {
    settings = {
      pylsp = {
        plugins = {
          autopep8 = {
            enabled = false,
          },
          flake8 = {
            enabled = false,
          },
          jedi_completion = {
            enabled = false,
          },
          jedi_definition = {
            enabled = false,
          },
          jedi_hover = {
            enabled = false,
          },
          jedi_references = {
            enabled = false,
          },
          jedi_signature_help = {
            enabled = false,
          },
          jedi_symbols = {
            enabled = false,
          },
          mccabe = {
            enabled = false,
          },
          preload = {
            enabled = false,
          },
          pycodestyle = {
            enabled = true,
            -- ignore = {"E501"},
            maxLineLength = 90,
          },
          pyflakes = {
            enabled = false,
          },
          pylint = {
            enabled = false,
          },
          rope_autoimport = {
            enabled = false,
          },
          rope_completion = {
            enabled = false,
          },
          yapf = {
            enabled = false,
          },
        },
      },
    },
  },
  rust_analyzer = {
    settings = {
      ['rust-analyzer'] = {
        diagnostics = {
          enable = false;
        }
      },
    },
  },
  -- vimls = {},
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
