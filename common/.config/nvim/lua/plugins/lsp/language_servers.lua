M = {}

M.default_opts = {}

M.language_servers = {
  clangd = {},
  jsonls = {},
  julials = {},
  pylsp = {
    on_attach = function(_, bufnr)
      require("which-key").register(
        {
          ['<leader>la'] = { vim.lsp.buf.range_code_action, "Code Action" },
        },
        { buffer = bufnr, mode = 'v', noremap = true, silent = true }
      )
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
  ruff_lsp = {},
  typst_lsp = {},
}

return M
