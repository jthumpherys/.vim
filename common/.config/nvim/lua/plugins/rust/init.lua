return {
  {
    "simrat39/rust-tools.nvim",
    name = "rust",
    config = true,
    opts = {
      on_attach = require("plugins.rust.config").on_attach
    },
    ft = "rust",
  },

  {
    "saecki/crates.nvim",
    name = "crates",
    config = true,
    dependencies = { "plenary" },
    event = { "BufRead Cargo.toml" },
  }
}
