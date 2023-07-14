local M = {}

M.global_keymap = {
  ['<leader>t'] = {
    name = "Telescope",
    s = { require("telescope").extensions.ultisnips.ultisnips, "View snippets" },
  }
}

return M
