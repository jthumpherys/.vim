return {
  {
    "RRethy/vim-illuminate",
    name = "illuminate",
    init = function() vim.cmd[[hi def IlluminatedWordText gui=underline]] end,
    opts = {
      providers = { "lsp", "treesitter" },
      delay = 200,
      modes_allowlist = {'n'},
      min_count_to_highlight = 2,
    },
    config = function(_, opts) require("illuminate").configure(opts) end,
    dependencies = { "treesitter" },
    event = "VeryLazy",
  },
}
