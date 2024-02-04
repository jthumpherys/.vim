local M = { operators = {} }

local km = require("utils.keymaps")
local keymaps = require("plugins.editing.keymaps")


local comment_ops, comment_map
M.comment_keys, comment_ops, comment_map = km.process(keymaps.comment)
for operator, description in pairs(comment_ops) do
  M.operators[operator] = description
end

function M.comment(_, opts)
  for _, opt in pairs({"opleader", "toggler", "extra"}) do
    if opts[opt] == nil then
      opts[opt] = {}
    end
  end

  for _, op in pairs({"line", "block"}) do
    opts.opleader[op] = keymaps.comment_keys[op .. "_prefix"]
    opts.toggler[op] = keymaps.comment_keys[op .. "_prefix"] .. keymaps.comment_keys.toggler
  end
  for _, motion in pairs({"above, below, eol"}) do
    opts.extra[motion] = keymaps.comment_keys[motion]
  end
  require("Comment").setup(opts)

  for _, map in pairs(comment_map) do
    require("which-key").register(unpack(map))
  end
end


local yanky_map
M.yanky_keys, _, yanky_map = km.process(keymaps.yanky)

function M.yanky(_, opts)
  require("yanky").setup(opts)
  require("telescope").load_extension("yank_history")

  for _, map in pairs(yanky_map) do
    require("which-key").register(unpack(map))
  end
end


-- M.swap_keys = {}
-- for prefix, _ in pairs(maps.swap_map) do
--   table.insert(M.swap_keys, prefix)
-- end

-- function M.swap_config_function(_, opts)
--   opts = opts or {}
--   if opts.keymaps == nil then
--     opts.keymaps = {}
--   end
--   local keymap = {}
--   local b_swap = require("binary-swap")
--   for prefix, keymaps in pairs(maps.swap_map) do
--     keymap[prefix] = { name = keymaps.name }
--     for key, map in pairs(keymaps) do
--       if map.plugin == "sibling" then
--         opts.keymaps[prefix .. key] = map.func
--         keymap[prefix][key] = { map.description }
--       elseif map.plugin == "binary" then
--         keymap[prefix][key] = { b_swap[map.func], map.description }
--       end
--     end
--   end

--   require("sibling-swap").setup(opts)

--   require("which-key").register(keymap)
-- end

return M
