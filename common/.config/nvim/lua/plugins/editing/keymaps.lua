local M = {}

M.comment_map = {
  ['<leader>c'] = {
    name = "Comment",
    c = { "Comment this line" },
    ['0'] = { "Add comment above current line" },
    o = { "Add comment below current line" },
    A = { "Add comment at the end of the current line" },
  },
  ['<leader>b'] = {
    name = "BlockComment",
    c = { "Comment this line" },
  }
}


M.yanky_map = {
  ['<leader>y'] = { name = "Put" },

  Y = { "<Plug>(YankyYank)", "Yank without moving cursor", mode = { 'n', 'x' } },

  p = { "<Plug>(YankyPutAfter)", "Put after" },
  P = { "<Plug>(YankyPutBefore)", "Put before" },

  ['<c-n>'] = { "<Plug>(YankyCycleForward)" },
  ['<c-p>'] = { "<Plug>(YankyCycleBackward)" },
}

local yanky_keys = {
  put_type = {
    Put = nil,
    GPut = { key = 'g', name = "GotoEnd", description = "and move cursor to end" },
  },
  rewriter = {
    [""] = nil,
    Joined = { key = 'h', name = "JoinedPut", description = "as single line" },
  },
  modifier = {
    [""] = nil,
    Linewise = { key = 'l', description = "linewise" },
    ShiftRight = { key = '>', description = "with increased indent" },
    ShiftLeft = { key = '<', description = "with decreased indent" },
    Filter = { key = 'r', description = "reindent" },
  },
  where = {
    After = { key = 'p', description = "after" },
    Before = { key = 'P', description = "before" },
    IndentAfter = { key = 'j', description = "after while matching current line indent" },
    IndentBefore = { key = 'k', description = "before while matching current line indent" },
  },
}
local function_pieces_order = { "put_type", "where", "modifier", "rewriter" }

local function recurse_keys(keymap, keys, piece_itr, yanky_options)
  local itr = vim.deepcopy(piece_itr)
  local yopts = vim.deepcopy(yanky_options)
  local piece, options = itr:next()
  print(piece)
  print(options)
  if piece then
    print("here")
    for option, data in pairs(options) do
      yanky_options[piece] = option
      if data ~= nil then
        local key = keys .. data.key
        if data.name ~= nil then
          -- create new group
          keymap[key] = recurse_keys({ name = data.name }, "", itr, yopts)
        else
          -- append key and continue
          keymap = recurse_keys(keymap, key, itr, yopts)
        end
      else
        -- empty option
        keymap = recurse_keys(keymap, keys, itr, yopts)
      end
    end
  else
    if keys ~= "" then
      local f = "<Plug>(Yanky"
      local d = "Put"
      for _, p in pairs(function_pieces_order) do
        local option = yanky_options[p]
        if option then
          f = f .. option
        else
          print(vim.inspect(yanky_options))
        end
        local opt = yanky_keys[p][option]
        if opt ~= nil and opt.description ~= nil then
          d = d .. opt.description
        end
      end
      keymap[keys] = { f, d }
    end
    return keymap
  end
  return keymap
end
function M.get_yanky_special_map()
  local smap = {
    name = "SpecialPut",
  }
  local piece_itr = vim.iter(yanky_keys)
  return recurse_keys(smap, "", piece_itr, {})
end

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
    name = "Swap",
    s = {
      plugin = "binary",
      func = "swap_operands",
      description = "Swap operands",
    },
    S = {
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


M.global_keymap = {}
for prefix, map in pairs(M.comment_map) do
  M.global_keymap[prefix] = map.name
end
for key, map in pairs(M.yanky_map) do
  M.global_keymap[key] = map
end
for prefix, keymaps in pairs(M.swap_map) do
  M.global_keymap[prefix] = { name = keymaps.name }
end

return M
