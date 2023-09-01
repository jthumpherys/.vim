local M = {}

M.language_servers = {
  -- bashls = {},
  clangd = {},
  lua_ls = {
    single_file_support = true,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        workspace = {
          checkThirdParty = false,
        },
      },
    },
  },
  -- ltex = {},
  pylsp = {
    on_attach = function(_, bufnr)
      vim.api.nvim_buf_set_keymap(
        bufnr,
        'v',
        '<leader>la',
        "<cmd>lua vim.lsp.buf.range_code_action()<CR>",  -- for rope
        { noremap = true, silent = true }
      )
      local config = require("plugins.lsp.config").get_default_server_options()
      config.on_attach(_, bufnr)
    end,
    settings = {
      pylsp = {
        plugins = {
          autopep8 = { enabled = false },  -- ruff
          jedi_completion = {
            include_class_objects = true,
            include_function_objects = true,
            fuzzy = true,
            eager = true,
          },
          pycodestyle = { enabled = false },  -- ruff
          pydocstyle = { enabled = false },  -- ruff
          pyflakes = { enabled = false },  -- ruff
          pylint = { enabled = false },  -- mypy
          rope_completion = {
            enabled = true,
            eager = true,
          },
          yapf = { enabled = false },
        },
      },
    },
  },
  -- pylyzer = {},
}

return M
