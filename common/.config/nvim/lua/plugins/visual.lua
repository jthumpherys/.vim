return {
  {
    "yamatsum/nvim-cursorline",
    name = "cursorline",
    enabled = false,
    opts = {
      cursorline = {
        enable = true,
        timeout = 1000,
        number = false,
      },
      -- cursorword = { enable = false }, -- illuminate already does this
      event = { "BufReadPost", "BufNewFile" },
    },
  },

  {
    "mawkler/modicator.nvim",
    name = "modicator",
    opts = {
      highlights = {
        defaults = {
          bold = true,
        },
      },
    },
    config = true,
    init = function()
      vim.opt.termguicolors = true
      vim.opt.cursorline = true
      vim.opt.number = true
    end,
    event = { "VeryLazy" },
  },

  {
    "mvllow/modes.nvim",
    name = "modes",
    enabled = false,
    version = "*",
    opts = {
      set_number = false,
      set_cursor = true,
      set_cursorline = false,
    },
    config = true,
    event = { "BufReadPost", "BufNewFile" },
  },
}
