return {
  {
    "hrsh7th/nvim-cmp",
    name = "cmp",
    opts = {
      snippet = {
        expand = function(args) vim.fn["UltiSnips#Anon"](args.body) end,
      },
      sources = {
        {
          { name = "nvim_lsp" },
          { name = "nvim_lsp_signature_help" },
          { name = "ultisnips" },
          { name = "treesitter" },
          { name = "crates" },
        },
        {
          { name = "buffer" },
        }
      },
    },
    config = require("plugins.completion.config").cmp_config_function,
    dependencies = {
      "lspconfig",

      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",

      "crates",

      "petertriho/cmp-git",
      "Dosx001/cmp-commit",

      "pairs",

      "snips_cmp",

      "lukas-reineke/cmp-under-comparator",
    },
    event = { "BufReadPost", "BufNewFile" },
  },

  {
    "quangnguyen30192/cmp-nvim-ultisnips",
    name = "snips_cmp",
    opts = {
    },
    dependencies = { "ultisnips", "treesitter" },
  },

  {
    "windwp/nvim-ts-autotag",
    name = "autotag",
    enabled = false,
  },

  {
    "windwp/nvim-autopairs",
    name = "pairs",
    opts = {
      check_ts = true,
    },
    config = require("plugins.completion.config").pairs_config_function,
  },

  {
    "m4xshen/autoclose.nvim",
    name = "autoclose",
    opts = {
      options = {
        pair_spaces = true
      },
      keys = {
      },
    },
    config = true,
  },
}
