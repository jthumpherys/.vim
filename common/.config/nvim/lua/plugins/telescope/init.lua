local extensions = require("plugins.telescope.utils").extensions
local extension_opts = require("plugins.telescope.utils").extension_opts

local map = require("plugins.telescope.keymaps")

return {
  {
    "nvim-telescope/telescope.nvim",
    name = "telescope",
    config = function(_, opts)
      opts.extensions = extension_opts
      require("telescope").setup(opts)

      for _, extension in pairs(extensions) do
        require("telescope").load_extension(extension)
      end

      map.set_telescope()
    end,
    dependencies = { "plenary" },
    cmd = "Telescope",
    keys = {
      { '<leader>/', desc = "+search" },
      { '<leader>f', desc = "+files" },
    },
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    name = "telescope-fzf",
    build = "make",
    init = function()
      table.insert(extensions, "fzf")
    end,
  },

  {
    "jvgrootveld/telescope-zoxide",
    init = function()
      table.insert(extensions, "zoxide")
    end,
  },
}
