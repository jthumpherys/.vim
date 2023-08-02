M = {}

M.global_keymap = {
  z = {
    K = { require("ufo").peekFoldedLinesUnderCursor, "" },
  --   R = { require("ufo").open },
  },
}

return M
