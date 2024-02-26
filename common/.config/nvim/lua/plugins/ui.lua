return {
  {
    "nvim-lualine/lualine.nvim",
    config = true,
    lazy = false,
    dependencies = { "devicons" },
  },

  {
    "sitiom/nvim-numbertoggle",
    name = "numbertoggle",
    event = { "BufReadPost", "BufNewFile" },
  },

  {
    "mawkler/modicator.nvim",
    -- enabled = false,
    config = true,
    opts = {
      highlights = {
        defaults = {
          bold = true,
          bg = require("tokyonight.colors").default.bg_highlight,
        },
      },
    },
    event = { "BufEnter", "VeryLazy" },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    name = "view-indent",
    main = "ibl",
    opts = {
      indent = {
        char = "▏",
      },
      scope = {
        char = "▎",
        show_start = false,
        show_end = false,
        highlight = "Label",
      },
      exclude = { filetypes = { "gitconfig" }, },
    },
    config = true,
    version = "*",
    event = { "BufReadPost", "BufNewFile" },
  },

  {
    "NvChad/nvim-colorizer.lua",
    main = "colorizer",
    config = true,
    opts = {
      user_default_options = {
        names = false,
        RRGGBBAA = true,
        AARRGGBB = true,
        always_update = true,
      },
      mode = "background",
    },
    event = "VeryLazy",
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      -- numhl = true,
      -- on_attach = function(bufnr)
      --   require("which-key").register({}, {bufnr=bufnr})
      -- end,
    },
    config = true,
    event = "VeryLazy",
  },

  {
    "kevinhwang91/nvim-ufo",
    opts = {
      provider_selector = function(bufnr, _, _)
        if vim.lsp.get_clients({bufnr=bufnr}) then
          return { "lsp", "indent" }
        else
          return { "treesitter", "indent" }
        end
      end,
    },
    config = function(opts)
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 99
      require("ufo").setup(opts)
    end,
    init = function()
      require("plugins.lsp.language_servers").extend_capabilities(
        function()
          return {
            textDocument = {
              foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
              }
            }
          }
        end
      )
      table.insert(require("plugins.whichkey.utils").to_register, {
        zR = { function() require("ufo").openAllFolds() end, "Open all folds" },
        zM = { function() require("ufo").openAllFolds() end, "Close all folds" },
        zr = { function() require("ufo").openFoldsExceptKinds() end, "Decrease fold level" },
        zm = { function() require("ufo").closeFoldsWith() end, "Increase fold level" },
      })
    end,
    dependencies = { "kevinhwang91/promise-async" },
    keys = { 'zc', 'zo', 'zC', 'zO' },
  },
}
