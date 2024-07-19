local M = {}

M.comment = {
  {
    '<leader>c',
    function()
      return require("Comment.api").call("toggle.linewise", 'g@')()
    end,
    group = "Comment",
    expr = true,
  },
  { '<leader>cc', function() require("Comment.api").toggle.linewise.current() end, desc = "Current Line" },
  { '<leader>cO', function() require("Comment.api").toggle.linewise.above() end, desc = "Insert Previous Line" },
  { '<leader>co', function() require("Comment.api").toggle.linewise.below() end, desc = "Insert Next Line" },
  { '<leader>cA', function() require("Comment.api").locked("insert.linewise.eol") end, desc = "Insert End of Line" },

  {
    '<leader>b',
    function()
      return require("Comment.api").call("toggle.blockwise", 'g@')()
    end,
    group = "Block Comment",
    expr = true,
  },
  { '<leader>bc', function() require("Comment.api").toggle.blockwise.current() end, desc = "Current Line" },
  { '<leader>bO', function() require("Comment.api").toggle.blockwise.above() end, desc = "Insert Previous Line" },
  { '<leader>bo', function() require("Comment.api").toggle.blockwise.below() end, desc = "Insert Next Line" },
  { '<leader>bA', function() require("Comment.api").locked("insert.blockwise.eol") end, desc = "Insert End of Line" },
}

return M
