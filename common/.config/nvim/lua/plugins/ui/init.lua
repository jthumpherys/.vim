return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      styles = {
	keywords = { italic = false },
      },
      lualine_bold = true,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd[[colorscheme tokyonight]]
    end
  },
	{
		"Shatur/neovim-ayu",
		name = "ayu",
	},

	{
		"nvim-lualine/lualine.nvim",
		opts = { theme = "tokyonight" },
    lazy = false,
    config = true,
	},

	{
		"EdenEast/nightfox.nvim",
		enabled = false,
		name = "nightfox",
		lazy = false,
		priority = 100,
		version = "*",
		opts = {
			options = {
				transparent = false,
				dim_inactive = true,
			},
		},
		config = function(_, opts)
			require("nightfox").setup(opts)
			vim.cmd("colorscheme carbonfox")
		end,
		build = ":NightfoxCompile",
		dependencies = { "treesitter", "ts-playground" },
	},

	{
		"freddiehaddad/feline.nvim",
		enabled = false,
		name = "feline",
		config = function()
			require("plugins.ui.feline")
		end,
		dependencies = "devicons",
		event = { "BufReadPre", "BufNewFile" },
	},

	{
		"stevearc/dressing.nvim",
		config = true,
		event = "VeryLazy",
	},

	{
		"sitiom/nvim-numbertoggle",
		name = "numbertoggle",
		init = function()
			vim.opt.number = true
		end,
		event = { "BufReadPost", "BufNewFile" },
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		name = "indent",
		main = "ibl",
		version = "*",
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
		},
		config = true,
		event = "VeryLazy",
	},

	-- this don't work
	{
		"HiPhish/rainbow-delimiters.nvim",
		config = function()
			local delim = require("rainbow-delimiters")
			vim.g.rainbow_delimiters = {
				strategy = {
					[""] = delim.strategy["global"],
					latex = delim.strategy["local"],
				},
				query = {
					[""] = "rainbow-delimiters",
					lua = "rainbow-blocks",
					latex = "rainbow-blocks",
				},
				highlight = {
					"RainbowDelimiterViolet",
					"RainbowDelimiterCyan",
					"RainbowDelimiterBlue",
					"RainbowDelimiterGreen",
				},
			}
		end,
		event = "VeryLazy",
		dependencies = { "treesitter" },
	},
  {
    "NvChad/nvim-colorizer.lua",
    main = "colorizer",
    config = true,
    opts = {
      user_default_options = {
	RRGGBBAA = true,
	AARRGGBB = true,
	always_update = true,
      },
    },
  },
}
