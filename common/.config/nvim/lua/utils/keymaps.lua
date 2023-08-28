local M = {}

function M.process(maps)
  local prefixes = {}
  local operators = {}
  local keymap = {}
  for _, group in pairs(maps) do
    for key, map in pairs(group[1]) do
      table.insert(prefixes, key)
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
