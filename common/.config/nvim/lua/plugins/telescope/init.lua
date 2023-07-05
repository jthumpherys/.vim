local M = {require("plugins.telescope.config").get_plugins()}

table.insert(M,
  {
    "nvim-telescope/telescope.nvim",
    name = "telescope",
    opts = function()
      local options = {}
      local extensions = require("plugins.telescope.config").extensions
      options.extensions = {}
      for name, extension in pairs(extensions) do
        options.extensions[name] = extension.telescope_opts or {}
      end
      return options
    end,
    version = "*",
    event = "VeryLazy",
    dependencies = { "treesitter", "plenary", "devicons" },
  }
)

return M
