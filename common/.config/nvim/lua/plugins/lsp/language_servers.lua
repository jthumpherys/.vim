local M = {}

M.language_servers = {
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
  -- rust_analyzer = {
  --   settings = {
  --     ['rust-analyzer'] = {
  --       diagnostics = {
  --         enable = true;
  --       }
  --     },
  --   },
  -- },
}

M.keymaps = {
  ["<leader>l"] = {
    name = "LSP",
    r = { vim.lsp.buf.rename, "Rename" },
    a = { vim.lsp.buf.code_action, "Code Action" },
    d = { vim.diagnostic.open_float, "Line Diagnostics" },
    i = { "<cmd>LspInfo<CR>", "Lsp Info" },
  },
}

function M.set_keymaps(_, bufnr)
  require("which-key").register(M.keymaps, { buffer = bufnr })
end

M.default_options = {
  on_attach = M.set_keymaps
}

return M
