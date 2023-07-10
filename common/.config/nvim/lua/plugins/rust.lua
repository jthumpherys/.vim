return {
  {
    "simrat39/rust-tools.nvim",
    name = "rust",
    -- enabled = false,
    opts = {
      server = {
        on_attach = function(_, bufnr)
          local rt = require("rust-tools")
          local keymaps = require("plugins.lsp.keymaps").keymaps

          keymaps.J = { rt.join_lines.join_lines, "Join next line" }
          keymaps.K = { rt.hover_actions.hover_actions, "Hover action" }

          keymaps['<leader>l'].a = { rt.code_action_group.code_action_group, "Code action" }
          keymaps['<leader>l'].j = { function() rt.move_item.move_item(false) end, "Move item down" }
          keymaps['<leader>l'].k = { function() rt.move_item.move_item(true) end, "Move item up" }
          keymaps['<leader>l'].e = { rt.expand_macro.expand_macro, "Expand macro recursively" }
          keymaps['<leader>l'].p = { rt.parent_module.parent_module, "Go to parent module" }
          keymaps['<leader>l'].g = { rt.crate_graph.view_crate_graph, "Go to parent module" }

          require("which-key").register(keymaps, { buffer = bufnr })
          rt.inlay_hints.enable()
        end,
        settings = {
          ['rust_analyzer'] = {
            diagnostics = {
              enable = true,
            },
          },
        },
      },
    },
    dependencies = { "lspconfig" },
    lazy = false,
  },

  {
    "saecki/crates.nvim",
    name = "crates",
    config = true,
    dependencies = { "plenary" },
    event = { "BufRead Cargo.toml" },
  },
}
