return {
  {
    "nvim-telescope/telescope.nvim",
    name = "telescope",
    version = "*",
    setup = function()
      require("telescope").load_extension("fzf")
    end,
    events = "VeryLazy",
    dependencies = { "treesitter", "plenary" },
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    name = "telescope-fzf",
    build = "make",
  },

  {
    "nvim-tree/nvim-tree.lua",
    name = "tree",
    opts = {
      renderer = { highlight_git = true },
    },
    config = true,
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      vim.opt.termguicolors = true
    end,
    dependencies = { "devicons" },
  },

  {
    "terrortylor/nvim-comment",
    name = "comment",
    main = "nvim_comment",
    opts = {
      comment_empty = false,
    },
    config = true,
		event = "VeryLazy",
    -- keys = 'gc',
  },

  {
    "gbprod/yanky.nvim",
    name = "yanky",
    config = function()
      vim.keymap.set({'n','x'}, 'p', "<Plug>(YankyPutAfter)")
      vim.keymap.set({'n','x'}, 'P', "<Plug>(YankyPutBefore)")
      vim.keymap.set({'n','x'}, 'gp', "<Plug>(YankyGPutAfter)")
      vim.keymap.set({'n','x'}, 'gP', "<Plug>(YankyGPutBefore)")

      vim.keymap.set('n', ']p', "<Plug>(YankyPutIndentAfterLinewise)")
      vim.keymap.set('n', '[p', "<Plug>(YankyPutIndentBeforeLinewise)")

      vim.keymap.set('n', '>p', "<Plug>(YankyPutIndentAfterShiftRight)")
      vim.keymap.set('n', '<p', "<Plug>(YankyPutIndentAfterShiftLeft)")
      vim.keymap.set('n', '>P', "<Plug>(YankyPutIndentBeforeShiftRight)")
      vim.keymap.set('n', '<P', "<Plug>(YankyPutIndentBeforeShiftLeft)")

      vim.keymap.set('n', '=p', "<Plug>(YankyPutAfterFilter)")
      vim.keymap.set('n', '=P', "<Plug>(YankyPutBeforeFilter)")

      vim.keymap.set('n', '<c-n>', "<Plug>(YankyCycleForward)")
      vim.keymap.set('n', '<c-p>', "<Plug>(YankyCycleBackward)")

      vim.keymap.set('n', 'sp', function() require("telescope").load_extension("yanky_history") end)

      require("yanky").setup()
    end,
    version = "*",
    dependencies = { "telescope" },
    event = "VeryLazy",
    -- keys = {
    --   'y', 'p', 'P', 'gp', 'gP',
    --   ']p', '[p', '>p', '<p', '>P', '<P', '=p', '=P',
    --   'sp'
    -- },
  },

	{
		"mcauley-penney/tidy.nvim",
		name = "tidy",
		config = true,
		event = { "BufWritePre" },
	},
}
