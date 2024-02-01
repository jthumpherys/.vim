return {
  {
    "vxpm/ferris.nvim",
    config = true,
    init = function()
      require("plugins.lsp.language_servers").extend_on_attach(
        "rust_analyzer",
        function(_, bufnr)
          require("which-key").register(
            {
              ['<leader>l'] = {
                m = { require("ferris.methods.expand_macro"), "Expand Macro" },
                d = { require("ferris.methods.open_documentation"), "Documentation" },
                l = { require("ferris.methods.reload_workspace"), "Reload Workspace" },
              },
              g = {
                c = { require("ferris.methods.open_cargo_toml"), "Cargo.toml" },
                p = { require("ferris.methods.open_parent_module"), "Parent Module" },
              },
            },
            { buffer = bufnr }
          )
        end
      )
    end,
    ft = "rust",
  },

  {
    "Canop/nvim-bacon",
    opts = {
      quickfix = {
        enabled = false,
      },
    },
    init = function()
      require("plugins.lsp.language_servers").extend_on_attach(
        "rust_analyzer",
        function(_, bufnr)
          local bacon = require("bacon")
          require("which-key").register(
            {
              ['<leader>b'] = {
                name = "Bacon",
                n = { bacon.bacon_next, "Next" },
                p = { bacon.bacon_previous, "Previous" },
                l = { bacon.bacon_list, "List" },
                b = { bacon.open_selected_location, "Open Under Cursor" },
              },
            },
            { buffer = bufnr }
          )
          vim.api.nvim_create_autocmd("BufWritePost",
            {
              buffer = bufnr,
              callback = bacon.bacon_load,
            }
          )
        end
      )
    end,
    ft = "rust",
  },

  {
    "Saecki/crates.nvim",
    version = "*",
    config = function()
      require("cmp").setup.buffer({ sources = { { name = "crates" }, }, })
    end,
    event = "BufRead Cargo.toml",
  },
}
