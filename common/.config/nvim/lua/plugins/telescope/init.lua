local M = require("plugins.telescope.config").get_plugins()

table.insert(M,
  {
    "nvim-telescope/telescope.nvim",
    name = "telescope",
    opts = function()
      local options = {
        defaults = {
          mapping = {
            n = { ['<leader>t'] = require("trouble.providers.telescope").open_with_trouble },
          },
        },
      }
      local extensions = require("plugins.telescope.config").extensions
      options.extensions = {}
      for name, extension in pairs(extensions) do
        options.extensions[name] = extension.telescope_opts or {}
      end
      return options
    end,
    version = "*",
    dependencies = { "treesitter", "plenary", "devicons" },
    -- event = "VeryLazy",
  }
)

return M
