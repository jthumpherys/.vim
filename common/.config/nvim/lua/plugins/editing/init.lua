local map = require("plugins.editing.keymaps")
local wk = require("plugins.whichkey.utils")

return {
  {
    "numToStr/Comment.nvim",
    name = "comment",
    opts = function() return {
      mappings = {
        basic = false,
        extra = false,
      },
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      ignore = '^$',  -- ignore empty lines
    } end,
    config = true,
    init = function()
      wk.operators['<leader>c'] = "Comment"
      table.insert(wk.to_register, map.comment)
    end,
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

  {
    "kylechui/nvim-surround",
    version = '*',
    config = true,
    init = function()
      wk.operators['<leader>s'] = "Surround"
      wk.operators['<leader>s'] = "Surround New Lines"
      table.insert(wk.to_register, map.surround)
    end,
    keys = map.surround_keys,
  },
}
