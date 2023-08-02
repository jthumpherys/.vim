return {
  {
    "RRethy/vim-illuminate",
    name = "illuminate",
    opts = {
      providers = { "lsp", "treesitter" },
      delay = 200,
      modes_allowlist = {'n'},
      min_count_to_highlight = 2,
    },
    config = require("plugins.navigation.config").illuminate_config_function,
    event = "VeryLazy",
    dependencies = { "treesitter" },
  },
}
