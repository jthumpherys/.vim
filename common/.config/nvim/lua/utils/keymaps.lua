local M = {}

function M.process(maps)
  local prefixes = {}
  local operators = {}
  local keymap = {}
  for _, group in pairs(maps) do
    for key, map in pairs(group[1]) do
      if map.name ~= nil then
        table.insert(prefixes, {key, desc=map.name})
      elseif map[2] ~= nil then
        table.insert(prefixes, {key, desc=map[2]})
      else
        table.insert(prefixes, key)
      end
      if map.operator == true then
        operators[key] = map.name
        map.operator = nil
      end
    end
    table.insert(keymap, group)
  end
  return prefixes, operators, keymap
end

return M
