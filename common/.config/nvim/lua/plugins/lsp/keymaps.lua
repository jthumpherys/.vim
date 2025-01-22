M = {}

local function get_preview(func, opts)
  return function() require("goto-preview")[func](opts) end
end
local function get_goto(func, opts)
  return get_preview("goto_preview_" .. func, opts)
end

M.on_attach = {
  { '<leader>l', group = "lsp" },
  { '<leader>lr', vim.lsp.buf.rename, desc = "Rename" },
  { '<leader>la', "<cmd>Lspsaga code_action<CR>", desc = "Code Action" },
  { '<leader>li', "<cmd>LspInfo<CR>", desc = "Lsp Info" },
  { '<leader>lf', vim.lsp.buf.format, desc = "Format" },

  { '<leader>g', group = "goto" },
  { '<leader>gd', get_goto("definition"), desc = "Definition" },
  { '<leader>gD', get_goto("declaration"), desc = "Declaration" },
  { '<leader>gI', get_goto("implementation"), desc = "Implementation" },
  { '<leader>gy', get_goto("type_definition"), desc = "Type Definition" },
  { '<leader>gr', get_goto("references"), desc = "References" },
  { '<leader>gs', vim.lsp.buf.signature_help, desc = "Signature Help" },

  { '<c-c>', get_preview("close_all_win"), desc = "Close preview windows" },

  { '<leader>w', group = "workspace" },
  { '<leader>wa', vim.lsp.buf.add_workspace_folder, desc = "Add workspace folder" },
  { '<leader>wd', vim.lsp.buf.remove_workspace_folder, desc = "Remove workspace folder" },
  { '<leader>wl', vim.lsp.buf.list_workspace_folders, desc = "List workspace folders" },

  { '<leader>d', group = "diagnostics" },
  { '<leader>dd', vim.diagnostic.open_float, desc = "Line Diagnostics" },
  { '<leader>dn', function() require("lspsaga.diagnostic"):goto_next() end, desc = "Next diagnostic" },
  { '<leader>dp', function() require("lspsaga.diagnostic"):goto_prev() end, desc = "Previous diagnostic" },
  {
    '<leader>dN',
    function() require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR }) end,
    desc = "Next error",
  },
  {
    '<leader>dP',
    function() require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR }) end,
    desc = "Previous error",
  },
  { '<leader>dq', vim.diagnostic.setloclist, desc = "Set loc list" },

  -- { 'K', "<cmd>Lspsaga hover_doc<CR>", desc = "Hover action" },
  { '<leader>K', "<cmd>Lspsaga hover_doc ++keep<CR>", desc = "Pinned Docs" },
  { '<leader>t', "<cmd>Lspsaga term_toggle<CR>", desc = "Terminal" },
}

return M
