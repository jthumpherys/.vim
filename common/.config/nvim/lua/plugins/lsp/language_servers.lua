local general_capabilities = nil

local language_servers = {
  clangd = {},
  jsonls = {},
  julials = {},
  marksman = {},
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
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = { command = "clippy" },
        -- cargo = {
        --   buildScripts = {
        --     rebuildOnSave = true,
        --   },
        -- },
      },
    },
  },
  typst_lsp = {
    settings = {
      exportPdf = "onType",
    },
  },
}

function M.extend_capabilities(capabilities)
  local preexisting = general_capabilities
  if preexisting == nil then
    general_capabilities = capabilities
  else
    general_capabilities = function()
      vim.tbl_deep_extend("keep", preexisting(), capabilities())
    end
  end
end

function M.extend_on_attach(server_name, func)
  local server = language_servers[server_name]
  local preexisting = server.on_attach
  if preexisting ~= nil then
    server.on_attach = function(client, bufnr)
      preexisting(client, bufnr)
      func(client, bufnr)
    end
  else
    server.on_attach = func
  end
end

function M.setup()
  for server_name, server_opts in pairs(language_servers) do
    if server_opts.capabilities == nil then
      server_opts.capabilities = general_capabilities()
    end
    require("lspconfig")[server_name].setup(server_opts)
  end
end

return M
