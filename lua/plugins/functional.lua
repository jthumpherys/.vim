return {
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
      require("yanky").setup()
      require("telescope").load_extension("yank_history")

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

      vim.keymap.set('n', 'yp', function() require("telescope").extensions.yank_history.yank_history() end)
    end,
    version = "*",
    dependencies = { "telescope" },
    event = "VeryLazy",
    -- keys = {
    --   'y', 'p', 'P', 'gp', 'gP',
    --   ']p', '[p', '>p', '<p', '>P', '<P', '=p', '=P',
    --   'yp'
    -- },
  },

  {
    "kevinhwang91/nvim-ufo",
    name = "ufo",
    config = true,
    init = function()
      vim.o.signcolumn = "yes:1"
      vim.o.foldcolumn = '0' -- '1'
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
    event = { "BufReadPost", "BufNewFile" },
--  keys = {
--    { 'n', 'zR', require("ufo").openAllFolds },
--    { 'n', 'zM', require("ufo").closeAllFolds },
--  },
    dependencies = { "kevinhwang91/promise-async" },
  },

	{
		"mcauley-penney/tidy.nvim",
		name = "tidy",
    opts = {
      filetype_exclude = { "markdown", "diff" },
    },
		config = true,
		event = { "BufWritePre" },
	},

  {
    "sindrets/diffview.nvim",
    name = "diffview",
    opts = {
      enhanced_diff_hl = true,
    },
    dependencies = { "plenary", "devicons" },
    cmd = { "DiffviewFileHistory", "DiffviewOpen" },
  },
}
