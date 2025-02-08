local M = {}

M.comment = {
  {
    '<leader>c',
    function()
      return require("Comment.api").call("toggle.linewise", 'g@')()
    end,
    group = "comment",
    expr = true,
  },
  { '<leader>cc', function() require("Comment.api").toggle.linewise.current() end, desc = "Current Line" },
  { '<leader>cO', function() require("Comment.api").insert.linewise.above() end, desc = "Insert Previous Line" },
  { '<leader>co', function() require("Comment.api").insert.linewise.below() end, desc = "Insert Next Line" },
  { '<leader>cA', function() require("Comment.api").locked("insert.linewise.eol")() end, desc = "Insert End of Line" },

  {
    '<leader>b',
    function()
      return require("Comment.api").call("toggle.blockwise", 'g@')()
    end,
    group = "comment block",
    expr = true,
  },
  { '<leader>bc', function() require("Comment.api").toggle.blockwise.current() end, desc = "Current Line" },
  { '<leader>bO', function() require("Comment.api").insert.blockwise.above() end, desc = "Insert Previous Line" },
  { '<leader>bo', function() require("Comment.api").insert.blockwise.below() end, desc = "Insert Next Line" },
  { '<leader>bA', function() require("Comment.api").locked("insert.blockwise.eol")() end, desc = "Insert End of Line" },
}

M.ufo = {
  { 'zR', function() require("ufo").openAllFolds() end, desc = "Open all folds" },
  { 'zM', function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
  { 'zr', function() require("ufo").openFoldsExceptKinds() end, desc = "Fold less" },
  { 'zm', function() require("ufo").closeFoldsWith() end, desc = "Fold less" },
  {
    'K',
    function()
      local winid = require("ufo").peekFoldedLinesUnderCursor()
      if not winid then
        vim.cmd([[Lspsaga hover_doc]])
      end
    end,
    desc = "Hover action",
  },
}

return M
