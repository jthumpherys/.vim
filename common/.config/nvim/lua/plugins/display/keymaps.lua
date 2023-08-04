local M = {}

M.global_keymap = {
  z = {
    R = { require("ufo").openAllFolds, "Open all folds" },
    M = { require("ufo").closeAllFolds, "Close all folds" },
  }
}

return M
