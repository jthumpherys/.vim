local M = {}

M.extensions = {
  fzf = {
    plugin = {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
  },
  file_browser = {
    plugin = {
      "nvim-telescope/telescope-file-browser.nvim",
      dependencies = { "plenary", "devicons" }
    },
    telescope_opts = {
      theme = "ivy",
      -- hijack_netrw = true,
      -- cwd_to_path = true,
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
