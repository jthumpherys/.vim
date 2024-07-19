local utils = require("plugins.whichkey.utils")

return {
  "folke/which-key.nvim",
  opts = {
    delay = 500,
    icons = {
      keys = {
        Space = "␣",
        CR = "↵ ",
        Tab = "⇥ ",
      },
    },
    presets = {
      operators = false,
    },
  },
  config = function(_, opts)
    table.insert(utils.spec, opts.spec or {})
    opts.spec = utils.spec
    -- opts.presents.operators = utils.operators
    require("which-key").setup(opts)
  end,
  dependencies = { "devicons" },
  event = "VeryLazy",
}
