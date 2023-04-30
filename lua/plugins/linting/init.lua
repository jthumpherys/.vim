return {
  "jose-elias-alvarez/null-ls.nvim",
  name = "null-ls",
  config = function()
    require("null-ls").setup(require("plugins.linting.config").get_options())
  end,
  dependencies = { "plenary" },
  ft = require("plugins.linting.config").filetypes,
}
