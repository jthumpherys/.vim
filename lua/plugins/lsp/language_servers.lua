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

default_options = {
}

local function set_keymaps(client, bufnr)
  local whichkey require("which-key")

  local opts = { noremap = true, silent = true }

  whichkey.register(
    {
      ["<leader>l"] = {
        name = "",
        r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
        a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
        d = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
        i = { "<cmd>LspInfo<CR>", "Lsp Info" },
      },
    }
  )
end

return M
