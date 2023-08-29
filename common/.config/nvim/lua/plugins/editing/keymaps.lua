local M = { operators = {} }

M.comment_keys = {
  line_prefix = '<leader>c',
  block_prefix = '<leader>b',

  toggler = 'c',

  above = '0',
  below = 'o',
  eol = 'A',
}

M.comment = {
  {
    {
      [M.comment_keys.line_prefix] = {
        name = "Comment",
        operator = true,
        [M.comment_keys.toggler] = { "Comment line" },
        [M.comment_keys.above] = { "Add comment above current line" },
        [M.comment_keys.below] = { "Add comment below current line" },
        [M.comment_keys.eol] = { "Add comment at the end of the current line" },
      },
      [M.comment_keys.block_prefix] = {
        name = "BlockComment",
        operator = true,
        [M.comment_keys.toggler] = { "Comment line blockwise" },
      },
    },
  },

  {
    {
      ['<leader>c'] = { "Comment selection" },
      ['<leader>b'] = { "Comment selection blockwise" },
    },
    { mode = "x" },
  },
}


M.yanky = {
  {
    {
      ['<leader>p'] = {
        name = "Put",
        t = { function() require("telescope").extensions.yank_history.yank_history() end, "Put from telescope" },
      },


      p = { "<Plug>(YankyPutAfter)", "Put after" },
      P = { "<Plug>(YankyPutBefore)", "Put before" },

      ['<c-n>'] = { "<Plug>(YankyCycleForward)" },
      ['<c-p>'] = { "<Plug>(YankyCycleBackward)" },
    },
  },

  {
    {
      Y = { "<Plug>(YankyYank)", "Yank without moving cursor" },
    },
    { mode = { 'n', 'x' }, },
  },
}

local yanky_keys = {
  put_type = {
    Put = {},
    GPut = { key = 'g', name = "GotoEnd", description = "move cursor to end" },
  },
  rewriter = {
    [""] = {},
    Joined = { key = 'o', name = "JoinedPut", description = "as single line" },
  },
  modifier = {
    [""] = {},
    Linewise = { key = 'l', name = "Linewise", description = "linewise" },
    Charwise = { key = 'c', name = "Charwise", description = "charwise" },
    Blockwise = { key = 'b', name = "Blockwise", description = "blockwise" },
    ShiftRight = { key = '>', name = "ShiftRight", description = "increase indent" },
    ShiftLeft = { key = '<', name = "ShiftLeft", description = "decrease indent" },
    Filter = { key = 'r', name = "Reindent", description = "reindent" },
  },
  where = {
    After = { key = 'p', description = "after" },
    Before = { key = 'P', description = "before" },
    IndentAfter = { key = 'j', description = "after match indent" },
    IndentBefore = { key = 'k', description = "before match indent" },
  },
}
local function_section_order = { "put_type", "where", "modifier", "rewriter" }
local description_section_order = { "where", "rewriter", "modifier", "put_type" }
local keybind_section_order = { "put_type", "rewriter", "modifier", "where" }

local function recurse_keys(keymap, keys, command_sections, evaluated_sections)
  -- print(vim.inspect(keymap))
  local map = vim.deepcopy(keymap)
  local command = vim.deepcopy(command_sections)
  local already_done = vim.deepcopy(evaluated_sections)
  for _, section in pairs(keybind_section_order) do
    if not vim.tbl_contains(already_done, section) then
      table.insert(already_done, section)
      for put_type, keybind in pairs(yanky_keys[section]) do
        command[section] = put_type
        if keybind.key ~= nil then
          local key = keys .. keybind.key
          if keybind.name ~= nil then
            -- create new group
            map[key] = recurse_keys({ name = keybind.name }, "", command, already_done)
          else
            -- append key and continue
            map = recurse_keys(map, key, command, already_done)
          end
        else
          -- empty option
          map = recurse_keys(map, keys, command, already_done)
        end
      end
    end
  end
  if keys ~= "" then
    local func = "<Plug>(Yanky"
    local description = "Put"
    for _, section_name in pairs(function_section_order) do
      local function_section = command[section_name]
      if function_section then
        func = func .. function_section
      end
    end
    for _, section_name in pairs(description_section_order) do
      local function_section = command[section_name]
      local opt = yanky_keys[section_name][function_section]
      if opt ~= nil and opt.description ~= nil then
        description = description .. ' ' .. opt.description
      end
    end
    func = func .. ')'
    map[keys] = { func, description }
  end
  return map
end

local piece_itr = vim.iter(yanky_keys)
local map = recurse_keys({}, "", piece_itr, {})
for key, m in pairs(map) do
  M.yanky[1][1]['<leader>p'][key] = m
end

-- function M.get_yanky_special_map()
--   local smap = {
--     name = "SpecialPut",
--   }
--   local piece_itr = vim.iter(yanky_keys)
--   return recurse_keys(smap, "", piece_itr, {})
-- end

--     local d = "Put"
--     for _, p in pairs(function_pieces_order) do
--       f = f .. yanky_options[p]
--       d = d .. yanky_keys[p][yanky_options[p]].description
--     end
--     f = f .. ")"

--     keymap[keys] = { f, d }
--     return keymap


--   for piece, options in pairs(yanky_keys) do
--     if not visited[piece] == "done" then
--       for option, data in pairs(options) do
--         yanky_options[piece] = option
--         if data ~= nil then
--           local key = keys .. data.key
--           if data.name ~= nil then
--             -- new group
--             keymap[key] = recurse_keys({ name = data.name }, visited, "", yanky_options)
--           else
--             -- final layer
--             recurse_keys(keymap, visited, key, yanky_options)
--           end
--         else
--           -- not doing this optional group yet
--           recurse_keys(keymap, visited, keys, yanky_options)
--         end
--       end
--       visited[piece] = "done"
--     end
--   end
--   if keys ~= "" then
--     local f = "<Plug>(Yanky"
--   end
-- end

--  ['<leader>p'] = {
--    name = "SpecialPut",
--
--    p = { "<Plug>(YankyGPutAfter)", "Put after and move cursor to end" },
--    P = { "<Plug>(YankyGPutBefore)", "Put before and move cursor to end" },
--
--    j = {
--      name = "LinewiseAfter",
--      j = { "<Plug>(YankyPutIndentAfterLinewise)", "Put on following line while matching indent" },
--      J = { "<Plug>(YankyPutAfterFilter)", "Put on following line and reindent" },
--      ['>'] = { "<Plug>(YankyPutIndentAfterShiftRight)", "Put on following line with increased indent" },
--      ['<'] = { "<Plug>(YankyPutIndentAfterShiftLeft)", "Put on following line with decreased indent" },
--    },
--    k = {
--      name = "LinewiseBefore",
--      k = { "<Plug>(YankyPutIndentBeforeLinewise)", "Put on previous line while matching indent" },
--      K = { "<Plug>(YankyPutBeforeFilter)", "Put on previous line and reindent" },
--      ['>'] = { "<Plug>(YankyPutIndentBeforeShiftRight)", "Put on previous line with increased indent" },
--      ['<'] = { "<Plug>(YankyPutIndentBeforeShiftLeft)", "Put on previous line with decreased indent" },
--    },
--
--    g = {
--      name = "GotoEnd",
--      j = {
--        name = "LinewiseAfterGotoEnd",
--        j = { "<Plug>(YankyGPutIndentAfterLinewise)", "Put on following line while matching indent and move cursor to end" },
--        J = { "<Plug>(YankyGPutAfterFilter)", "Put on following line and reindent and move cursor to end" },
--        ['>'] = { "<Plug>(YankyGPutIndentAfterShiftRight)", "Put on following line with increased indent and move cursor to end" },
--        ['<'] = { "<Plug>(YankyGPutIndentAfterShiftLeft)", "Put on following line with decreased indent and move cursor to end" },
--      },
--      k = {
--        name = "LinewiseBeforeGotoEnd",
--        k = { "<Plug>(YankyGPutIndentBeforeLinewise)", "Put on previous line while matching indent and move cursor to end" },
--        K = { "<Plug>(YankyGPutBeforeFilter)", "Put on previous line and reindent and move cursor to end" },
--        ['>'] = { "<Plug>(YankyGPutIndentBeforeShiftRight)", "Put on previous line with increased indent and move cursor to end" },
--        ['<'] = { "<Plug>(YankyGPutIndentBeforeShiftLeft)", "Put on previous line with decreased indent and move cursor to end" },
--      },
--    },
--  }
--}

M.swap_map = {
  ['<leader>s'] = {
    name = "Swap/Surround",
    b = {
      plugin = "binary",
      func = "swap_operands",
      description = "Swap operands",
    },
    B = {
      plugin = "binary",
      func = "swap_operands_with_operator",
      description = "Swap operands and reverse operator",
    },
    h = {
      plugin = "sibling",
      func = "swap_with_left",
      description = "Swap with left sibling",
    },
    H = {
      plugin = "sibling",
      func = "swap_with_left_with_opp",
      description = "Swap left and reverse operator",
    },
    l = {
      plugin = "sibling",
      func = "swap_with_right",
      description = "Swap with right sibling",
    },
    L = {
      plugin = "sibling",
      func = "swap_with_right_with_opp",
      description = "Swap right and reverse operator",
    },
  },
}


-- M.global_keymap = {}
-- for prefix, map in pairs(M.comment_map) do
--   M.global_keymap[prefix] = map.name
-- end
-- for key, map in pairs(M.yanky_map) do
--   M.global_keymap[key] = map
-- end
-- for prefix, keymaps in pairs(M.swap_map) do
--   M.global_keymap[prefix] = { name = keymaps.name }
-- end

return M
