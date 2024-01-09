local M = {}

function M.setup()
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '

  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  vim.opt.expandtab = true
  vim.opt.shiftwidth = 2
  vim.opt.softtabstop = -1

  vim.opt.termguicolors = true
  vim.opt.wrap = false
  vim.opt.number = true

  vim.opt.incsearch = true
  vim.opt.smartcase = true

  vim.g.markdown_recommended_style = 0
end

return M
