local M = {}

M.extensions = {
  fzf = {
    plugin = {
      "nvim-telescope/telescope-fzf-native.nvim",
      name = "telescope-fzf",
      build = "make",
    },
  },
  lazy = {
    plugin = {
      "tsakirist/telescope-lazy.nvim",
    },
  },
  ultisnips = {
    plugin = {
      "fhill2/telescope-ultisnips.nvim",
      dependencies = { "ultisnips" },
    },
  },
  undo = {
    plugin = {
      "debugloop/telescope-undo.nvim",
      dependencies = { "plenary" },
    },
    telescope_opts = {
      side_by_side = true,
      layout_strategy = "vertical",
      layout_config = {
        preview_height = 0,8,
      },
    },
  },
}

local plugin_defaults = {
  version = "*",
  dependencies = {},
  event = "VeryLazy",
}

function M.get_plugins()
  local plugins = {}
  for name, plugin in pairs(M.extensions) do
    local lazy_entry = plugin.plugin
    for option_name, option in pairs(plugin_defaults) do
      if not lazy_entry[option_name] ~= nil then
        lazy_entry[option_name] = option
      end
    end
    table.insert(lazy_entry.dependencies, "telescope")
    lazy_entry.config = function()
      if plugin.config ~= nil then
        plugin.config()
      end
      require("telescope").load_extension(name)
    end
    table.insert(plugins, lazy_entry)
  end
  return plugins
end

return M
