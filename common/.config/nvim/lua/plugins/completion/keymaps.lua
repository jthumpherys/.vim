local M = {}

-- local snips_mappings = require("cmp_nvim_ultisnips.mappings")

M.cmp_map = {
  -- ['<tab>'] = {
  --   func = { "mapping" },
  --   args = {
  --     function(fallback) snips_mappings.expand_or_jump_forwards(fallback) end,
  --     { 'i', 's' },
  --   },
  -- },

  -- ['<s-tab>'] = {
  --   func = { "mapping" },
  --   args = {
  --     function(fallback) snips_mappings.jump_backwards(fallback) end,
  --     { 'i', 's' },
  --   },
  -- },

  ['<c-space>'] = {
    func = "complete",
    args = {},
  },

  ['<CR>'] = {
    func = "confirm",
    args = { select = true },
  },

  ['<c-a>'] = {
    func = "abort",
    args = {},
  },

  ['<c-h>'] = {
    func = "scroll_docs",
    args = -4,
  },

  ['<c-l>'] = {
    func = "scroll_docs",
    args = 4,
  },
}

return M
