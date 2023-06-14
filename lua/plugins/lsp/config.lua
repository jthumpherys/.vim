local M = {}


M.lsp_servers = {
  lua_ls = {
    single_file_support = true,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        -- diagnostics = {
        --   globals = {'vim'},
        -- },
        workspace = {
          checkThirdParty = false,
          -- library = vim.api.nvim_get_runtime_file("", true),
        },
      },
    },
  },
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
            enabled = false,
            -- ignore = {"E501"},
            maxLineLength = 90,
          },
          pyflakes = {
            enabled = false,
          },
          pylint = {
            enabled = true,
            args = {"--max-line-length=90"},
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
          enable = true;
        }
      },
    },
  },
}


M.null_packages = {
  lua = {
    stylua = { method = "formatting" },
    -- selene = { method = "diagnostics" },
  },
  python = {
    ruff = { method = "formatting" },
    mypy = { method = "diagnostics" },
  },
  zsh = { zsh = { method = "diagnostics", mason = false }},
}

M.null_installs = {}
for _, pkgs in pairs(M.null_packages) do
  for name, pkg in pairs(pkgs) do
    if pkg.mason == nil or pkg.mason then
      table.insert(M.null_installs, name)
    end
  end

  vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      local opts = { noremap = true, silent = true, buffer = ev.buf }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    end,
  })
end

M.null_filetypes = {}
for lang, _ in pairs(M.null_packages) do
  table.insert(M.null_filetypes, lang)
end

local null_opts = { sources = {} }
function M.get_null_options()
  local null = require("null-ls")
  for _, pkgs in pairs(M.null_packages) do
    for name, pkg in pairs(pkgs) do
      table.insert(null_opts.sources, null.builtins[pkg.method][name])
    end
  end
  return null_opts
end


M.defaults = {
  capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), require("cmp_nvim_lsp").default_capabilities())
}
M.defaults.capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

return M
