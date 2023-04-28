return {
  {
    "EdenEast/nightfox.nvim",
    name = "nightfox",
    lazy = false,
    priority = 100,
    version = "*",

    opts = {
			options = {
				transparent = false,
				dim_inactive = true,
			},

			-- palettes = {
			-- 	carbonfox = {
			-- 	},
			-- 	duskfox = {
			-- 		bg1 = "#0b0b0b",
			-- 		bg0 = "#1d1d2b", -- Alt backgrounds (floats, statusline, ...)
			-- 		bg3 = "#121820", -- 55% darkened from stock
			-- 		sel0 = "#131b24",
			-- 	},
			-- },
			-- specs = {
			-- 	duskfox = {
			-- 		inactive = "#101010",
			-- 	},
			-- 	carbonfox = {
			-- 		inactive = "#090909", -- wash out colors instead?
			-- 	},
			-- },
			-- groups = {
			-- 	carbonfox = {
			-- 		NormalNC = {}, -- fix carbonfox Non-current window
			-- 	},
			-- },
    },

    config = function(_, opts)
      require('nightfox').setup(opts)
      vim.cmd("colorscheme carbonfox")
    end,
    build = ":NightfoxCompile",
    dependencies = { "treesitter", "ts-playground" },
  },
}
