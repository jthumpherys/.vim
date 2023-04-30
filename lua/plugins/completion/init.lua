return {
  {
    "hrsh7th/nvim-cmp",
    name = "cmp",
    config = function(_, opts)
      require("cmp")
      require("plugins.completion.config").setup(opts or {})
    end,
    main = "cmp",
    dependencies = {
      "lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "lukas-reineke/cmp-under-comparator",
      { "quangnguyen30192/cmp-nvim-ultisnips", dependencies = { "ultisnips", "treesitter" } },
      -- { "saadparwaiz1/cmp_luasnip", dependencies = { "L3MON4D3/LuaSnip" } }
    },
    event = { "BufReadPost", "BufNewFile" },
  },
}
