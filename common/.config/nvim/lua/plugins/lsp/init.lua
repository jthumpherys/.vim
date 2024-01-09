local servers = require("plugins.lsp.language_servers")
local map = require("plugins.lsp.keymaps")

return {
  {
    "neovim/nvim-lspconfig",
    name = "lspconfig",
    config = function()
      for server_name, server_opts in pairs(servers.language_servers) do
        vim.tbl_deep_extend("keep", server_opts, servers.default_opts)
        require("lspconfig")[server_name].setup(server_opts)
      end
    end,
    init = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(env)
          require("which-key").register(map.on_attach, {buffer = env.buf})
        end,
      })
    end,
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        opts = { automatic_installation = true },
        config = true,
        dependencies = { "mason" },
      },
    },
    event = { "BufReadPre", "BufNewFile" },
  },

  {
    "williamboman/mason.nvim",
    name = "mason",
    build = ":MasonUpdate",
    config = true,
    cmd = { "Mason", "MasonUpdate", "MasonInstall", "MasonUninstall" },
  },

  {
    "rmagatti/goto-preview",
    name = "goto-preview",
    -- opts = function()
    --   local ok, module = pcall(require, "plugins.lsp.local")
    --   if ok then return module.goto_preview_opts else return {} end
    -- end,
    config = true,
  },

  {
    "folke/neodev.nvim",
    opts = {
      override = function(root_dir, library)
        if root_dir:find("/home/jade/.dotfiles", 1, true)
            or root_dir:find("/home/jade/projects/nvim-dev", 1, true) then
          library.enabled = true
          library.plugins = true
        end
      end
    },
    config = function(_, opts)
      require("neodev").setup(opts)
      require("lspconfig").lua_ls.setup(
        {
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
        }
      )
    end,
    ft = "lua",
  },

  {
    "mrcjkb/rustaceanvim",
    version = "*",
    config = function(bufnr)
      require("which-key").register(
        {
          ['<leader>l'] = {
            m = { vim.cmd.RustLsp("expandMacro"), "Expand Macro" },
            c = { vim.cmd.RustLsp("openCargo"), "Open Cargo File" },
            p = { vim.cmd.RustLsp("parentModule"), "Open Parent Module" },
          },
          K = { vim.cmd.RustLsp({"hover", "range"}), "Hover", mode = 'v' },
        },
        {buffer = bufnr}
      )
    end,
    init = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = servers.on_attach,
        },
      }
    end,
    ft = "rust",
  },
}
