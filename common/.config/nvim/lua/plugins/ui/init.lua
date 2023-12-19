local config = require("plugins.ui.config")

return {
  {
    "Shatur/neovim-ayu",
    name = "ayu",
    enabled = false,
  },

  {
    "nvim-lualine/lualine.nvim",
    enabled = false,
    opts = {options ={ theme = "duskfox" }},
    lazy = false,
    priority = 500,
    config = true,
  },

  {
    "EdenEast/nightfox.nvim",
    name = "nightfox",
    lazy = false,
    priority = 1000,
    version = "*",
    opts = {
      transparent = false,
      dim_inactive = true,
      inverse = {
        match_paren = true,
      },
      styles = {
        comments = "italic",
        functions = "bold",
      },
    },
    config = config.nightfox,
    build = ":NightfoxCompile",
    dependencies = { "treesitter", "ts-playground" },
  },

  {
    "freddiehaddad/feline.nvim",
    -- enabled = false,
    name = "feline",
    config = function()
      require("plugins.ui.feline")
    end,
    -- dependencies = "devicons",
    event = { "BufReadPre", "BufNewFile" },
  },

  {
    "stevearc/dressing.nvim",
    config = true,
    event = "VeryLazy",
  },

  {
    "sitiom/nvim-numbertoggle",
    name = "numbertoggle",
    init = function()
      vim.opt.number = true
    end,
    event = { "BufReadPost", "BufNewFile" },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    name = "indent",
    main = "ibl",
    version = "*",
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
    },
    config = true,
    event = "VeryLazy",
  },

  -- this don't work
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      local delim = require("rainbow-delimiters")
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = delim.strategy["global"],
          latex = delim.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
          latex = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
          "RainbowDelimiterBlue",
          "RainbowDelimiterGreen",
      },
    }
    end,
    event = "VeryLazy",
    dependencies = { "treesitter" },
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
    },
    config = true,
    event = "VeryLazy",
  },
}
