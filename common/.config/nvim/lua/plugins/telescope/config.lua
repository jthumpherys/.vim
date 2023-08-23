local M = {}

function M.telescope(_, opts)
  local extensions = require("plugins.telescope.extensions")
  opts.extensions = extensions.options
  require("telescope").setup(opts)

  for _, extension in pairs(extensions.autoload) do
    require("telescope").load(extension)
  end
end

return M
