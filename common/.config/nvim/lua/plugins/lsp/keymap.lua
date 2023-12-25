M = {}

local function get_preview(func, opts)
  return function() require("goto-preview")[func](opts) end
end
local function get_goto(func, opts)
  return get_preview("goto_preview_" .. func, opts)
end

M.on_attach = {
  ["<leader>l"] = {
    name = "+lsp",
    r = { vim.lsp.buf.rename, "Rename" },
    a = { vim.lsp.buf.code_action, "Code Action" },
    i = { "<cmd>LspInfo<CR>", "Lsp Info" },
    f = { vim.lsp.buf.format, "Format" },
  },

  g = {
    name = "+goto",
    d = { get_goto("definition"), "Definition" },
    D = { get_goto("declaration"), "Declaration" },
    I = { get_goto("implementation"), "Implementation" },
    y = { get_goto("type_definition"), "Type Definition" },
    r = { get_goto("references"), "References" },
    s = { vim.lsp.buf.signature_help, "Signature Help" },
  },
  ['<c-c>'] = { get_preview("close_all_win"), "Close preview windows" },

  ["<leader>w"] = {
    name = "+workspace",
    a = { vim.lsp.buf.add_workspace_folder, "Add workspace folder" },
    d = { vim.lsp.buf.add_workspace_folder, "Remove workspace folder" },
    l = { vim.lsp.buf.list_workspace_folders, "List workspace folders" },
  },

  K = { vim.lsp.buf.hover, "Hover action" },

  ["<leader>d"] = {
    name = "+diagnostics",
    d = { vim.diagnostic.open_float, "Line Diagnostics" },
    n = { vim.diagnostic.goto_next, "Next error" },
    p = { vim.diagnostic.goto_prev, "Previous error" },
    q = { vim.diagnostic.setloclist, "Set loc list" },
  }
}

return M
