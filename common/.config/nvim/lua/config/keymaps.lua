local M = {}

function M.setup()
  vim.keymap.set('i', 'jj', '<Esc>', {desc = "I don't like reaching for escape"})
  vim.keymap.set('n', 's', '<c-w>', {desc = "Switch split windows rapidly"})
  vim.keymap.set('n', 'g-', '<c-o>', {desc = "Return to previous position"})
  vim.keymap.set('n', 'g_', '<c-i>', {desc = "Jump forward positions"})
  vim.keymap.set('n', '<leader>o', 'Go', {desc = "Insert at new line EOF"})
end

return M
