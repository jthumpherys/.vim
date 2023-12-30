local map = require("plugins.editing.keymaps")

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
      local wk = require("plugins.whichkey.utils")
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
}
