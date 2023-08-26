local M = {}

function M.register(maps)
  for _, map in pairs(maps) do
    require("which-key").register(map)
  end
end

function M.get_keys(maps)
  local prefixes = {}
  for _, group in pairs(maps) do
    for key, map in pairs(group[1]) do
      local prefix = { key }

      -- if map.name ~= nil then
      --   prefix.desc = map.name
      -- elseif map[2] ~= nil then
      --   prefix.desc = map[2]
      --   if map[1] ~= nil then
      --     prefix[2] = map[1]
      --   end
      -- elseif map[1] ~= nil then
      --   prefix.desc = map[1]
      -- end

      -- if group[2] ~= nil then
      --   if group[2].mode ~= nil then
      --     prefix.mode = group[2].mode
      --   end
      -- end

      table.insert(prefixes, prefix)
    end
  end
  return prefixes
end

return M
