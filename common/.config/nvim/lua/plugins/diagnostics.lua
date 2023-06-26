return {
  {
    "folke/trouble.nvim",
    dependencies = { "devicons" },
    opts = { skip_groups = true, jump = true },
    config = function(_, opts)
      require("which-key").register(
        {
          ["<leader>x"] = {
            name = "Trouble",
            x = { "<cmd>TroubleToggle<cr>", "Toggle trouble" },
            w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "" },
            d = { "<cmd>TroubleToggle document_diagnostices<cr>", "" },
            l = { "<cmd>TroubleToggle loclist<cr>", "" },
            q = { "<cmd>TroubleToggle quickfix<cr>", "" },
          },
          ["gR"] = { "<cmd>TroubleToggle lsp_references<cr>", "" },
        }
      )

      require("trouble").next(opts)
    end,
    event = "VeryLazy",
  },
}
