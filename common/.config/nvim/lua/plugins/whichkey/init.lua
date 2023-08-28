return {
  {
    "folke/which-key.nvim",
    name = "which-key",
    opts = {
      plugins = {
        presets = { operators = false },
      },
      key_labels = {
        ['<space>'] = '␣',
        ['<cr>'] = '↵ ',
        ['<tab>'] = '⇥ ',
      },
    },
    config = require("plugins.whichkey.config").whichkey,
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
  },
}
