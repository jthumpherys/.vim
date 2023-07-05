local config = require("plugins.editing.config")

return {
  {
    "numToStr/Comment.nvim",
    name = "comment",
    opts = {
      toggler = {
        line = '<leader>cc',
        block = '<leader>bc',
      },
      opleader = {
        line = '<leader>c',
        block = '<leader>b',
      },
      extra = {
        above = '<leader>c0',
        below = '<leader>co',
        eol = '<leader>cA',
      },

      ignore = '^$',  -- ignore empty lines
    },
    config = true,
    version = "*",
    keys = config.comment_keys,
    event = "VeryLazy",
    dependencies = { "treesitter" },
  },

  {
    "terrortylor/nvim-comment",
    enabled = false,
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
    opts = {
      picker = {
        telescope = {
          use_default_mappings = false,
        },
      },
    },
    config = config.yanky_config_function,
    dependencies = { "telescope" },
    event = "VeryLazy",
    -- keys = config.yanky_keys,
  },

  {
    "Wansmer/sibling-swap.nvim",
    opts = {
      keymaps = {},
    },
    config = config.swap_config_function,
    dependencies = { "Wansmer/binary-swap.nvim", "treesitter" },
    keys = config.swap_keys,
  },
}
