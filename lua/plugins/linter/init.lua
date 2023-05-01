return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    name = "null-ls",
    config = function()
      require("null-ls").setup(require("plugins.linter.config").get_options())
      require("plugins.linter.config").setup()
    end,
    dependencies = { "plenary", "mason" },
    event = { "BufReadPre", "BufNewFile" },
    ft = require("plugins.linter.config").filetypes,
  },
}
