local M = {}

-- store operators here in init functions so whichkey will include them
M.operators = {}

M.spec = {}

function M.prepare_keybinds(spec, module, fn)
  local out = {}

  if spec.module ~= nil then
    if module == nil then
      module = spec.module
    else
      module = module .. '.' .. spec.module
    end
    spec.module = nil
  end
  if spec.fn ~= nil then
    if fn == nil then
      fn = spec.fn
    else
      fn = {
        type(fn)      == "string" and fn      or type(fn)      == "table" and unpack(fn),
        type(spec.fn) == "string" and spec.fn or type(spec.fn) == "table" and unpack(spec.fn)
      }
    end
    spec.fn = nil
  end

  if type(spec[1]) == "string" then
    if fn ~= nil then
      if module == nil then
        local current_fn = vim
        if type(fn) == "string" then
          current_fn = current_fn[fn]
        elseif type(fn) == "table" then
          for _, term in ipairs(fn) do
            current_fn = current_fn[term]
          end
        end
        spec[2] = { current_fn, spec.args }
      else
        if type(fn) == "string" then
          vim.notify(module..' '..fn, vim.diagnostic.severity.ERROR)
          spec[2] = function() return require(module)[fn](spec.args) end
        elseif type(fn) == "table" then
          vim.notify(vim.inspect(fn), vim.diagnostic.severity.ERROR)
          spec[2] = function()
            local call = require(module)
            for _, item in ipairs(fn) do call = call[item] end
            return call(spec.args)
          end
        else
          error("fn is bad type")
        end
      end
      spec.args = nil
    end
    table.insert(out, spec)

  else
    for _, block in ipairs(spec) do
      table.insert(out, M.prepare_keybinds(block, module, fn))
    end
  end

  return out
end

function M.add(spec)
  table.insert(M.spec, spec)
end

return M
