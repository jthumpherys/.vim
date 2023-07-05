return {
  {
    "RRethy/vim-illuminate",
    name = "illuminate",
    opts = {
      providers = { "lsp", "treesitter" },
      delay = 250,
      modes_allowlist = {'n'},
      min_count_to_highlight = 2,
    },
    config = function(_, opts)
      -- vim.highlight.create(,, false)
      vim.cmd[[hi def IlluminatedWordText gui=underline]]
      local illuminate = require("illuminate")
      illuminate.configure(opts)
      require("which-key").register(
        {
          ["<leader>"] = {
            n = { illuminate.goto_next_reference, "Go to next instance of word" },
            p = { illuminate.goto_prev_reference, "Go to previous instance of word" },
          }
        }
      )
    end,
    event = "VeryLazy",
    dependencies = { "treesitter" },
  },

  {
    "yamatsum/nvim-cursorline",
    name = "cursorline",
    enabled = false,
    opts = {
      cursorline = {
        enable = true,
        timeout = 1000,
        number = false,
      },
      -- cursorword = { enable = false }, -- illuminate already does this
      event = { "BufReadPost", "BufNewFile" },
    },
  },

  {
    "mawkler/modicator.nvim",
    name = "modicator",
    opts = {
      highlights = {
        defaults = {
          bold = true,
        },
      },
    },
    config = true,
    init = function()
      vim.opt.termguicolors = true
      vim.opt.cursorline = true
      vim.opt.number = true
    end,
    event = { "VeryLazy" },
  },

  {
    "mvllow/modes.nvim",
    name = "modes",
    enabled = false,
    version = "*",
    opts = {
      set_number = false,
      set_cursor = true,
      set_cursorline = false,
    },
    config = true,
    event = { "BufReadPost", "BufNewFile" },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    name = "indent",
    main = "indent_blankline",
    version = "*",
    opts = {
      show_current_context = true,
      -- char = '⎸',
      -- context_char = '⎸',
    },
    event = { "BufReadPost", "BufNewFile" },
  },

  {
    "sitiom/nvim-numbertoggle",
    name = "numbertoggle",
    init = function()
      vim.opt.number = true
    end,
    event = { "BufReadPost", "BufNewFile" },
  },
}
