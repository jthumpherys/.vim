local config = require("plugins.telescope.config")

return {
  {
    "nvim-telescope/telescope.nvim",
    name = "telescope",
    opts = {
      defaults = {
        mapping = {
          n = { ['<leader>t'] = require("trouble.providers.telescope").open_with_trouble },
        },
      },
    },
    config = config.telescope,
    version = "*",
    -- dependencies = { "treesitter", "plenary", "devicons" },
    dependencies = { "plenary" },
    -- event = "VeryLazy",
  },

  unpack(require("plugins.telescope.extensions").plugins),

  -- {
  --   "prochri/telescope-all-recent.nvim",
  --   config = true,
  --   dependencies = { "telescope" },
  -- }
}
