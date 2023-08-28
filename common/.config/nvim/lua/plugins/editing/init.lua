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
    lazy = false,
    keys = config.comment_keys,
    -- event = "VeryLazy",
    -- dependencies = { "treesitter" },
  },

  {
    "gbprod/yanky.nvim",
    name = "yanky",
    opts = {
      -- picker = {
      --   telescope = {
      --     use_default_mappings = false,
      --   },
      -- },
    },
    config = config.yanky,
    keys = config.yanky_keys,
    -- dependencies = { "telescope" },
    dependencies = { "sqlite" },
    -- event = "VeryLazy",
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

--   {
--     "willothy/moveline.nvim",
--     config = config.moveline_config_function,
--     build = "make",
--     event = "VeryLazy",
--   },

--   {
--     "Wansmer/sibling-swap.nvim",
--     config = config.swap_config_function,
--     dependencies = { "Wansmer/binary-swap.nvim", "treesitter" },
--     keys = config.swap_keys,
--   },

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
