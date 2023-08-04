local M = {}

M.global_keymap = {
  z = {
    R = { require("ufo").openAllFolds, "Open all folds" },
    M = { require("ufo").closeAllFolds, "Close all folds" },
    K = { require("ufo").peekFoldedLinesUnderCursor, "Peek fold" },
  }
}

return M
