local M = {}

local extensions = {
  fzf = {
    plugin = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  frecency = {
    plugin = {
      "nvim-telescope/telescope-frecency.nvim",
      dependencies = { "sqlite" },
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
      -- dependencies = { "ultisnips" },
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

local defaults = {
  version = { value = "*" },
  dependencies = { value = { "telescope" }, extend = true },
}

M.plugins = {}
M.options = {}
M.autoload = {}
for name, extension in pairs(extensions) do
  for option, value in pairs(defaults) do
    if extension.plugin[option] == nil then
      extension.plugin[option] = value.value
    elseif value.extend then
      vim.tbl_deep_extend("keep", extension.plugin[option], value.value)
    end
  end
  extension.plugin.name = "telescope-" .. name
  table.insert(M.plugins, extension.plugin)
  if extension.telescope_opts ~= nil then
    M.options[name] = extension.telescope_opts
  end
  if extension.autoload then
    table.insert(M.autoload, name)
  end
end

return M
