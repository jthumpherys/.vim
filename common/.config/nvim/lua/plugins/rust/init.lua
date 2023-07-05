return {
  {
    "simrat39/rust-tools.nvim",
    -- name = "rust",
    enabled = false,
    config = function()
      local rt = require("rust-tools")
      rt.setup(
        {
          server = {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            on_attach = function(_, bufnr)
              print("here")
              require("which-key").register(
                {
                  ["<leader>l"] = {
                    name = "LSP",
                    a = { rt.code_action_group.code_action_group, "Code action" },
                    -- j = { function() rt.move_item.move_item(false) end, "Move item down" },
                    -- k = { function() rt.move_item.move_item(true) end, "Move item up" },
                  },
                },
                { buffer = bufnr }
              )
            end,
          },
        }
      )
    end,
    -- opts = {
    --   server = {
    --     on_attach = require("plugins.rust.config").on_attach,
    --   },
    -- },
    dependencies = {"lspconfig"},
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
