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

--   {
--     "s1n7ax/nvim-search-and-replace",
--     config = true,
--   },

--   {
--     "gbprod/substitute.nvim",
--     opts = function()
--       return {
--         on_substitute = require("yanky.integration").substitute(),
--       }
--     end,
--     dependencies = { "yanky" },
--   },

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

  -- {
  --   "Wansmer/sibling-swap.nvim",
  --   opts = {
  --     use_default_keymaps = false,
  --   },
  --   config = config.sibling_swap,
  --   dependencies = { "treesitter" },
  --   keys = config.sibling_swap_keys,
  -- },

  -- {
  --   "Wansmer/binary-swap.nvim",
  --   config = config.binary_swap,
  --   keys = config.binary_swap_keys,
  -- },

--   {
--     "kylechui/nvim-surround",
--     version = "*",
--     opts = {
--       keymaps = {
--         normal = "<leader>s",
--         normal_cur = "<leader>ss",
--         normal_line = "<leader>S",
--         normal_cur_line = "<leader>SS",
--         visual = "s",
--         visual_line = "S",
--         delete = "<leader>sd",
--         change = "<leader>sc",
--         change_line = "<leader>Sc",
--       },
--     },
--     config = true,
--     dependencies = { "treesitter", "ts-textobjects" },
--     keys = config.swap_keys,
--   },
}
