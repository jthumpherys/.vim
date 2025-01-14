return {
  {
    "nvim-lualine/lualine.nvim",
    config = true,
    lazy = false,
    dependencies = { "devicons" },
  },

  {
    "sitiom/nvim-numbertoggle",
    name = "numbertoggle",
    event = { "BufReadPost", "BufNewFile" },
  },

  {
    "mawkler/modicator.nvim",
    -- enabled = false,
    config = true,
    opts = {
      highlights = {
        defaults = {
          bold = true,
          bg = require("tokyonight.colors").bg_highlight,
        },
      },
    },
    event = { "BufEnter", "VeryLazy" },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    name = "view-indent",
    main = "ibl",
    opts = {
      indent = {
        char = "▏",
      },
      scope = {
        char = "▎",
        show_start = false,
        show_end = false,
        highlight = "Label",
      },
      exclude = { filetypes = { "gitconfig" }, },
    },
    config = true,
    version = "*",
    event = { "BufReadPost", "BufNewFile" },
  },

  {
    "NvChad/nvim-colorizer.lua",
    main = "colorizer",
    config = true,
    opts = {
      user_default_options = {
        names = false,
        RRGGBBAA = true,
        AARRGGBB = true,
        always_update = true,
      },
      mode = "background",
    },
    event = "VeryLazy",
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      numhl = true,
      -- on_attach = function(bufnr)
      --   require("which-key").register({}, {bufnr=bufnr})
      -- end,
    },
    config = true,
    event = "VeryLazy",
  },
}
