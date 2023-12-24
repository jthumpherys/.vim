local extensions = require("plugins.telescope.utils").extensions
local extension_opts = require("plugins.telescope.utils").extension_opts

local map = require("plugins.telescope.keymap")

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

      require("which-key").register(map.telescope)
    end,
    dependencies = { "plenary" },
    cmd = "Telescope",
    keys = map.prefixes,
  },

  {

    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    init = function()
      table.insert(extensions, "fzf")
    end,
  },
}
