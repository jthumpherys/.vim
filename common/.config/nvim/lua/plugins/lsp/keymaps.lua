local M = {}

M.global_keymap = {
  ["<leader>l"] = {
    name = "LSP",
    r = { vim.lsp.buf.rename, "Rename" },
    a = { vim.lsp.buf.code_action, "Code Action" },
    i = { "<cmd>LspInfo<CR>", "Lsp Info" },
    f = { vim.lsp.buf.format, "Format" },
  },

  g = {
    name = "GoTo",
    d = { vim.lsp.buf.definition, "Definition" },
    D = { vim.lsp.buf.declaration, "Declaration" },
    s = { vim.lsp.buf.signature_help, "Signature Help" },
    I = { vim.lsp.buf.implementation, "Implementation" },
    y = { vim.lsp.buf.type_definition, "Type Definition" },
    r = { vim.lsp.buf.references, "References" },
  },

  ["<leader>w"] = {
    name = "Workspace",
    a = { vim.lsp.buf.add_workspace_folder, "Add workspace folder" },
    d = { vim.lsp.buf.add_workspace_folder, "Remove workspace folder" },
    l = { function() print(vim.inspect(vim.lsp.bif.list_workspace_folders())) end, "List workspace folders" },
  },

  K = { vim.lsp.buf.hover, "Hover action" },

  ["<leader>d"] = {
    name = "Diagnostics",
    d = { vim.diagnostic.open_float, "Line Diagnostics" },
    n = { vim.diagnostic.goto_next, "Next error" },
    p = { vim.diagnostic.goto_prev, "Previous error" },
    q = { vim.diagnostic.setloclist, "Set loc list" },
  }
}

return M
