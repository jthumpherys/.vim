local extensions = require("plugins.telescope.utils").extensions
local extension_opts = require("plugins.telescope.utils").extension_opts

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
    end,
    dependencies = { "plenary" },
    event = "VeryLazy",
  },

  {

    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    init = function()
      table.insert(extensions, "fzf")
    end,
  },
}
