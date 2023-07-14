local M = {}

function M.setup()
  -- Use true tabs for makefiles
  vim.api.nvim_create_autocmd(
    "FileType",
    {
      pattern = "make",
      callback = function()
        vim.bo.expandtab = false
        vim.bo.tabstop = 4
        vim.bo.shiftwidth = 0
      end,
    }
  )
  -- Wrap files that have text blocks
  vim.api.nvim_create_autocmd(
    "FileType",
    {
      pattern = "markdown",
      callback = function()
        vim.opt.wrap = true
      end,
    }
  )
end

return M
