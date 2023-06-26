return {
  {
    "hrsh7th/nvim-cmp",
    name = "cmp",
    opts = {
      snippet_function = vim.fn["UltiSnips#Anon"]
    },
    config = function(_, opts)
      require("plugins.completion.config").setup(opts or {})
    end,
    dependencies = {
      "lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "lukas-reineke/cmp-under-comparator",
      { "quangnguyen30192/cmp-nvim-ultisnips", dependencies = { "ultisnips", "treesitter" } },
    },
    event = { "BufReadPost", "BufNewFile" },
  },
}
