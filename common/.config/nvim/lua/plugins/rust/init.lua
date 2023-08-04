return {
  {
    "simrat39/rust-tools.nvim",
    name = "rust",
    -- enabled = false,
    opts = {
      server = {
        settings = {
          ['rust_analyzer'] = {
            diagnostics = {
              enable = true,
            },
          },
        },
      },
    },
    config = require("plugins.rust.config").config_function,
    dependencies = { "lspconfig" },
    event = { "BufReadPre *.rs", "BufNewFile *.rs" },
  },

  {
    "saecki/crates.nvim",
    name = "crates",
    config = true,
    dependencies = { "plenary" },
    event = { "BufRead Cargo.toml" },
  },
}
