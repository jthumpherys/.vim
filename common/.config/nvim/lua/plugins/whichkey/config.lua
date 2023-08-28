local M = {}

function M.whichkey(_, opts)
  if opts.operators == nil then
    opts.operators = {}
  end

  local plugins_path = vim.fn.stdpath("config") .. "/lua/plugins/"
  local dir_handle = vim.loop.fs_scandir(plugins_path)

  local item, _ = vim.loop.fs_scandir_next(dir_handle)
  while item do
    local nested_handle = vim.loop.fs_scandir(plugins_path .. item)
    if nested_handle then
      local nested_item, _ = vim.loop.fs_scandir_next(nested_handle)
      while nested_item do
        if nested_item == "config.lua" then
          local file = require("plugins." .. item .. ".config")
          if file ~= true then
            if file.operators ~= nil then
              print(vim.inspect(file.operators))
              table.insert(opts.operators, unpack(file.operators))
              print(vim.inspect(opts.operators))
            end
          end
        end
        nested_item, _ = vim.loop.fs_scandir_next(nested_handle)
      end
    end
    item, _ = vim.loop.fs_scandir_next(dir_handle)
  end

  require("which-key").setup(opts)
end

return M
