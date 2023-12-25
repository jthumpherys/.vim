local map = require("plugins.lsp.keymap")

M = {}

local function on_attach(_, bufnr)
  require("which-key").register(map.on_attach, { buffer = bufnr })
end

local default_opts = {
  on_attach = on_attach,
}

M.language_servers = {
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
  jsonls = {},
  julials = {},
  pylsp = {
    on_attach = function(_, bufnr)
      vim.api.nvim_buf_set_keymap(
        bufnr,
        'v',
        '<leader>la',
        "<cmd>lua vim.lsp.buf.range_code_action()<CR>",  -- for rope
        { noremap = true, silent = true }
      )
      on_attach(_, bufnr)
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
}

for _, opts in pairs(M.language_servers) do
  vim.tbl_deep_extend("keep", opts, default_opts)
end

return M
