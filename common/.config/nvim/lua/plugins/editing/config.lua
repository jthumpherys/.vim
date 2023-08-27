local M = {}

local keymaps = require("plugins.editing.keymaps")

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

  for _, map in pairs(keymaps.comment) do
    print(vim.inspect(map))
    -- local m = unpack(map)
    -- print(vim.inspect(m))
    require("which-key").register(unpack(map))
  end
end

M.comment_keys = require("utils.keymaps").get_keys(keymaps.comment)


function M.yanky(_, opts)
  require("yanky").setup(opts)
  require("telescope").load_extension("yank_history")
end


-- function M.moveline_config_function()
--   local moveline = require("moveline")
--   require("which-key").register(
--     {
--       ['<c-k>'] = { moveline.up, "Move line up" },
--       ['<c-j>'] = { moveline.down, "Move line down" },
--     }
--   )
--   require("which-key").register(
--     {
--       ['<c-k>'] = { moveline.block_up, "Move line up" },
--       ['<c-j>'] = { moveline.block_down, "Move line down" },
--     },
--     { mode = { 'v' } }
--   )
-- end


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
