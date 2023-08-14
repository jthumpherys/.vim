local M = {}

function M.get_default_server_options()
  local preview = require("goto-preview")
  local options = {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    on_attach = function (_, bufnr)
      require("which-key").register(
        {
          ["<leader>l"] = {
            name = "LSP",
            r = { vim.lsp.buf.rename, "Rename" },
            a = { vim.lsp.buf.code_action, "Code Action" },
            i = { "<cmd>LspInfo<CR>", "Lsp Info" },
            f = { vim.lsp.buf.format, "Format" },
          },

          g = {
            name = "GoTo",
            -- d = { vim.lsp.buf.definition, "Definition" },
            d = { preview.goto_preview_definition, "Definition" },
            D = { vim.lsp.buf.declaration, "Declaration" },
            s = { vim.lsp.buf.signature_help, "Signature Help" },
            -- I = { vim.lsp.buf.implementation, "Implementation" },
            I = { preview.goto_preview_implementation, "Implementation" },
            -- y = { vim.lsp.buf.type_definition, "Type Definition" },
            y = { preview.goto_preview_type_definition, "Type Definition" },
            -- r = { vim.lsp.buf.references, "References" },
            r = { preview.goto_preview_references, "References" },
          },
          ['<c-c>'] = { preview.close_all_win, "Close preview windows" },

          ["<leader>w"] = {
            name = "Workspace",
            a = { vim.lsp.buf.add_workspace_folder, "Add workspace folder" },
            d = { vim.lsp.buf.add_workspace_folder, "Remove workspace folder" },
            l = { function() print(vim.inspect(vim.lsp.bif.list_workspace_folders())) end, "List workspace folders" },
          },

          K = { vim.lsp.buf.hover, "Hover action" },

          ["<leader>d"] = {
            name = "Diagnostics",
            d = { vim.diagnostic.open_float, "Line Diagnostics" },
            n = { vim.diagnostic.goto_next, "Next error" },
            p = { vim.diagnostic.goto_prev, "Previous error" },
            q = { vim.diagnostic.setloclist, "Set loc list" },
          }
        },
        { buffer = bufnr }
      )
    end
  }
  options.capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  return options
end

function M.config_function()

  local lspconfig = require("lspconfig")
  local servers = require("plugins.lsp.language_servers")
  for server_name, server_opts in pairs(servers.language_servers) do
    server_opts = vim.tbl_deep_extend("keep", server_opts, M.get_default_server_options())
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
  opts.on_attach = M.get_default_server_options().on_attach
  require("null-ls").setup(opts)
end

return M
