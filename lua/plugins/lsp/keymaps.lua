local M = {}

local whichkey require("which-key")

local keymap = vim.api.nvim_set_keymap
local buf_keymap = vim.api.nvim_buf_set_keymap

local function set_keymappings(client, bufnr)
  local opts = { noremap = true, silent = true }

  vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_deep_extend("force", opts, { buffer = 0 }))
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '[e', vim.diagnostic.goto_prev, vim.tbl_deep_extend("force", opts, { severity = vim.diagnostic.severity.ERROR }))
  vim.keymap.set('n', ']e', vim.diagnostic.goto_prev, vim.tbl_deep_extend("force", opts, { severity = vim.diagnostic.severity.ERROR }))

  -- Whichkey
  local keymap_l = {
    l = {
      name = "Code",
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
      d = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
      i = { "<cmd>LspInfo<CR>", "Lsp Info" },
    },
  }
  if client.resolved_capabilities.document_formatting then
    keymapl.l.f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format Document" }
  end

  local keymap_g = {
    name = "Goto",
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
    D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
    s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
    I = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation" },
    t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },,
  }

  whichkey.register(keymap_l, { buffr = bufnr, prefix = "<leader>" })
  whichkey.register(keymap_g, { buffr = bufnr, prefix = "g" })
end

function M.setup(client, bufnr)
  set_keymappings(client, bufnr)
end

return M
