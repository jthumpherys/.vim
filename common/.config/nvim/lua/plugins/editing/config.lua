local M = {}

local maps = require("plugins.editing.keymaps")

M.comment_keys = {}
M.comment_prefixes = {}
for prefix, map in pairs(maps.comment_map) do
  table.insert(M.comment_keys, prefix)
  M.comment_prefixes[prefix] = map
end

function M.comment_config_function(_, opts)
  -- can't be run until config
  opts.pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
  require("Comment").setup(opts)
end


function M.yanky_config_function(_, opts)
  print("here")
  require("yanky").setup(opts)
  -- require("telescope").load_extension("yank_history")

  local whichkey = require("which-key")
  -- whichkey.register(maps.yanky_map)
  whichkey.register(maps.get_yanky_special_map(), { prefix = yanky_special_prefix })
end


M.swap_keys = {}
for prefix, _ in pairs(maps.swap_map) do
  table.insert(M.swap_keys, prefix)
end

function M.swap_config_function(_, opts)
  opts = opts or {}
  if opts.keymaps == nil then
    opts.keymaps = {}
  end
  local keymap = {}
  local b_swap = require("binary-swap")
  for prefix, keymaps in pairs(maps.swap_map) do
    keymap[prefix] = { name = keymaps.name }
    for key, map in pairs(keymaps) do
      if map.plugin == "sibling" then
        opts.keymaps[prefix .. key] = map.func
        keymap[prefix][key] = { map.description }
      elseif map.plugin == "binary" then
        keymap[prefix][key] = { b_swap[map.func], map.description }
      end
    end
  end

  require("sibling-swap").setup(opts)

  local whichkey = require("which-key")
  whichkey.register(keymap)
end

return M
