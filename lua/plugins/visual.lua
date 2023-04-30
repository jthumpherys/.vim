return {
  {
    "folke/which-key.nvim",
    name = "which-key",
		opts = {
			plugins = { presets = { operators = false } }
		},
    config = true,
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 1000
    end,
		event = "VeryLazy",
  },

  {
    "RRethy/vim-illuminate",
    name = "illuminate",
    opts = {
      providers = { "lsp", "treesitter" },
      delay = 750,
      modes_allowlist = {'n'},
      min_count_to_highlight = 2,
    },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
		event = "VeryLazy",
    dependencies = { "treesitter" },
  },

  {
    "yamatsum/nvim-cursorline",
    name = "cursorline",
    opts = {
      cursorline = {
        enable = true,
        timeout = 1000,
        number = false,
      },
      cursorword = { enable = false }, -- illuminate already does this
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
    event = { "BufReadPost", "BufNewFile" },
  },

  {
    "mvllow/modes.nvim",
    name = "modes",
    version = "*",
    enabled = false,
    opts = {
			set_number = true,
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
