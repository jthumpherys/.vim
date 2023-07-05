return {
  {
    "folke/which-key.nvim",
    name = "which-key",
    opts = {
      -- operators = { ['<leader>c'] = "Comments", ['<leader>b'] = "BlockComments" },

      plugins = {
        presets = { operators = false },
      },
      key_labels = {
        ['<space>'] = "␣",
        ['<cr>'] = "↵ ",
        ['<tab>'] = "⇥ ",
      },
    },
    config = require("plugins.whichkey.config").whichkey_config_function,
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 1000
    end,
    event = "VeryLazy",
  },
}
