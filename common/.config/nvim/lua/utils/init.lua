M = {}

function M.log(msg, hl, name)
  name = name or "Neovim"
  hl = hl or "Todo"
  vim.api.nvim_echo({ { name .. ": ", hl }, { msg } }, true, {})
end

function M.warn(msg, name)
  vim.notify(msg, vim.log.levels.WARN, { title = name })
end

function M.error(msg, name)
  vim.notify(msg, vim.log.levels.ERROR, { title = name })
end

function M.info(msg, name)
  vim.notify(msg, vim.log.levels.INFO, { title = name })
end


local function contains(table, val)
  for _, v in pairs(table) do
    if v == val then return true end
  end
  return false
end


function M.set_ft_window_option(filetype, options)
  local prev_values = {}
  vim.api.nvim_create_autocmd("BufWinEnter", {
    callback = function()
      if type(filetype) == "string" and vim.bo.filetype == filetype
          or type(filetype) == "table" and contains(filetype, vim.bo.filetype) then
        for opt, val in pairs(options) do
          prev_values[opt] = vim.wo[opt]
          vim.wo[opt] = val
        end
        vim.api.nvim_create_autocmd("BufUnload", {
          once = true,
          callback = function()
            for opt, val in pairs(prev_values) do
              vim.wo[opt] = val
            end
          end
        })
      end
    end
  })
end

return M
