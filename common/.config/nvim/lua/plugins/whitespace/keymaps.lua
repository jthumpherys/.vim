local M = {}

M.global_keymap = {
  ['<leader>w'] = {
    f = { ":TabsVsSpacesStandartize", "Standardize whitespace" },
    t = { ":TabsVsSpacesConvert spaces_to_tabs", "Set spacing to tabs" },
    s = { ":TabsVsSpacesConvert tabs_to_spaces", "Set spacing to spaces" },
  }
}

return M
