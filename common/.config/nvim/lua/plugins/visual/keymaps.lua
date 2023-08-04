local M = {}

M.global_keymap = {
  ['<c-n>'] = { require("illuminate").goto_next_reference, "Next word instance" },
  ['<c-p>'] = { require("illuminate").goto_prev_reference, "Previous word instance" },
}

return M
