local M = {}

M.global_keymap = {
  ["<leader>x"] = {
    name = "Trouble",
    x = { "<cmd>TroubleToggle<cr>", "Toggle trouble" },
    r = { "<cmd>TroubleRefresh<cr>", "Refresh" },

    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document diagnostics" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace diagnostics" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "Location list" },

    L = {
      name = "LSPinTrouble",
      r = { "<cmd>TroubleToggle lsp_references<cr>", "LSP references in Trouble" },
      d = { "<cmd>TroubleToggle lsp_definitions<cr>", "LSP definitions in Trouble" },
      t = { "<cmd>TroubleToggle lsp_type_definitions<cr>", "LSP type definitions in Trouble" },
    },
  },
}

return M
