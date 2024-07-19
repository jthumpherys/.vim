return {
  {
    "vxpm/ferris.nvim",
    config = true,
    init = function()
      require("plugins.lsp.language_servers").extend_on_attach(
        "rust_analyzer",
        function(_, bufnr)
          require("which-key").add(
            {
              buffer = bufnr,
              { '<leader>lm', require("ferris.methods.expand_macro"), desc = "Expand Macro" },
              { '<leader>ld', require("ferris.methods.open_documentation"), desc = "Documentation" },
              { '<leader>ll', require("ferris.methods.reload_workspace"), desc = "Reload Workspace" },

              { '<leader>gc', require("ferris.methods.open_cargo_toml"), desc = "Cargo.toml" },
              { '<leader>gp', require("ferris.methods.open_parent_module"), desc = "Parent Module" },
            }
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
          require("which-key").add(
            {
              buffer = bufnr,
              { '<leader>b', group = "Bacon" },
              { '<leader>bn', bacon.bacon_next, desc = "Next" },
              { '<leader>bp', bacon.bacon_previous, desc = "Previous" },
              { '<leader>bl', bacon.bacon_list, desc = "List" },
              { '<leader>bb', bacon.open_selected_location, desc = "Open Under Cursor" },
            }
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
