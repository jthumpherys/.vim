local M = {}

function M.whichkey(_, opts)
  local wk = require("which-key")
  wk.setup(opts)

  local plugins_path = vim.fn.stdpath("config") .. "/lua/plugins/"
  local dir_handle = vim.loop.fs_scandir(plugins_path)


  local item, _ = vim.loop.fs_scandir_next(dir_handle)
  while item do
    local nested_handle = vim.loop.fs_scandir(plugins_path .. item)
    if nested_handle then
      local nested_item, _ = vim.loop.fs_scandir_next(nested_handle)
      while nested_item do
        if nested_item == "keymaps.lua" then
          local file = require("plugins." .. item .. ".keymaps")
          wk.register(file.global_keymap)
        end
        nested_item, _ = vim.loop.fs_scandir_next(nested_handle)
      end
    end
    item, _ = vim.loop.fs_scandir_next(dir_handle)
  end
end

return M
