local M = {}

-- store operators here in init functions so whichkey will include them
M.operators = {}

M.spec = {}

function M.add(spec)
  table.insert(M.spec, spec)
end

return M
