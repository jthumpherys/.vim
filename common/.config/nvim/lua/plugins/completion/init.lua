local config = require("plugins.completion.config")

return {
  {
    "hrsh7th/nvim-cmp",
    name = "cmp",
    -- opts = {
    --   snippet = {
    --     expand = function(args) vim.fn["UltiSnips#Anon"](args.body) end,
    --   },
    --   sources = {
    --     {
    --       { name = "treesitter" },
    --       { name = "ultisnips" },

    --       { name = "nvim_lsp" },
    --       { name = "nvim_lsp_signature_help" },
    --       { name = "omni" },

    --       { name = "buffer-lines" },

    --       -- { name = "crates" },
    --     },
    --     {
    --       { name = "buffer" },
    --     },
    --   },
    --   sorting = {
    --     comparators = {
    --       { pkg = "cmp", subpkg = { "config", "compare", "offset" } },
    --       { pkg = "cmp", subpkg = { "config", "compare", "exact" } },
    --       { pkg = "cmp", subpkg = { "config", "compare", "score" } },
    --       { pkg = "cmp-under-comparator", subpkg = { "under" } },
    --       { pkg = "cmp", subpkg = { "config", "compare", "kind" } },
    --       { pkg = "cmp", subpkg = { "config", "compare", "sort_text" } },
    --       { pkg = "cmp", subpkg = { "config", "compare", "length" } },
    --       { pkg = "cmp", subpkg = { "config", "compare", "order" } },
    --     },
    --   },
    --   filetypes = {
    --     {
    --       type = "gitcommit",
    --       sources = {
    --         {
    --           { name = "git" },
    --           { name = "commit" },
    --         },
    --         { { name = "buffer" } },
    --       },
    --     },
    --     {
    --       type = "rust",
    --       sources = {
    --         { { name = "buffer" } },
    --       }
    --     },
    --     {
    --       type = "lua",
    --       sources = {
    --         {
    --           { name = "nvim_lua" },
    --           { name = "plugins" },
    --         },
    --         { { name = "buffer" } },
    --       },
    --     },
    --   },
    --   cmdlines = {
    --     {
    --       type = ':',
    --       sources = {
    --         { { name = "path" } },
    --         { { name = "cmdline" } },
    --       },
    --     },
    --     {
    --       type = { '/', '?' },
    --       sources = {
    --         { name = "buffer" },
    --         { name = "buffer-lines" },
    --       },
    --     },
    --   },
    -- },
    config = config.cmp_config_function,
    dependencies = {
      "lspconfig",

      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-omni",
      "hrsh7th/cmp-path",

      -- "lukas-reineke/cmp-rg",

      -- "kdheepak/cmp-latex-symbols", -- or
      -- "amarakon/nvim-cmp-lua-latex-symbols",

      -- { "KadoBOT/cmp-plugins", opts = { files = { "/home/jade/.config/nvim/lua" } } },

      -- "crates",

      "petertriho/cmp-git",
      "Dosx001/cmp-commit",

      "pairs",

      "snips-cmp",

      "lukas-reineke/cmp-under-comparator",
    },
    event = { "BufNewFile", "BufReadPost" },
  },

  {
    "quangnguyen30192/cmp-nvim-ultisnips",
    name = "snips-cmp",
    config = true,
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
    -- config = config.pairs_config_function,
    event = "InsertEnter",
  },

  {
    "m4xshen/autoclose.nvim",
    name = "autoclose",
    enabled = false,
    opts = {
      options = {
        pair_spaces = true,
      },
    },
    -- config = config.close_config_function,
    event = "InsertEnter",
  },
}
