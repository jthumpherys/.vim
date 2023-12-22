local config = require("plugins.editing.config")

return {
  {
    "numToStr/Comment.nvim",
    name = "comment",
    opts = function() return {
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      ignore = '^$',  -- ignore empty lines
    } end,
    config = config.comment,
    version = "*",
    -- lazy = false,
    keys = config.comment_keys,
  },

  {
    "gbprod/yanky.nvim",
    name = "yanky",
    opts = {
      ring = {
        storage = "sqlite",
      },
    },
    config = config.yanky,
    keys = config.yanky_keys,
  },

  {
    "willothy/moveline.nvim",
    build = "make",
    keys = {
      { '<C-j>', function() require("moveline").down() end, desc = "Move line down" },
      { '<C-k>', function() require("moveline").up() end, desc = "Move line up" },

      { '<C-j>', function() require("moveline").block_down() end, mode = 'v', desc = "Move block down" },
      { '<C-k>', function() require("moveline").block_up() end, mode = 'v', desc = "Move block up" },
    },
  },
}
