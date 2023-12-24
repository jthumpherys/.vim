local utils = require("plugins.whichkey.utils")

return {
  "folke/which-key.nvim",
  opts = {
    key_labels = {
      ['<space>'] = "␣",
      ['<cr>'] = "↵ ",
      ['<tab>'] = "⇥ ",
    },
  },
  config = function(_, opts)
    vim.tbl_deep_extend("keep", utils.operators, opts.operators or {})
    opts.operators = utils.operators
    require("which-key").setup(opts)
  end,
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  event = "VeryLazy",
}
