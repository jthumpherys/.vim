local M = {}

M.comment = {
  {
    {
      ['<leader>c'] = {
        function() return require("Comment.api").call("toggle.linewise", 'g@')() end,
        "Comment",
        expr = true,
      },
      ['<leader>b'] = {
        function() return require("Comment.api").call("toggle.blockwise", 'g@')() end,
        "Comment Block",
        expr = true,
      },
    },

    {
      ['<leader>c'] = {
        c = {
          function() require("Comment.api").toggle.linewise.current() end,
          "Current Line",
        },
        O = {
          function() require("Comment.api").insert.linewise.above() end,
          "Insert Previous Line",
        },
        o = {
          function() require("Comment.api").insert.linewise.below() end,
          "Insert Next Line",
        },
        A = {
          function() require("Comment.api").locked("insert.linewise.eol") end,
          "Insert End of Line"
        },
      },
      ['<leader>b'] = {
        c = {
          function() require("Comment.api").toggle.blockwise.current() end,
          "Current Line",
        },
        O = {
          function() require("Comment.api").insert.blockwise.above() end,
          "Insert Previous Line",
        },
        o = {
          function() require("Comment.api").insert.blockwise.below() end,
          "Insert Next Line",
        },
        A = {
          function() require("Comment.api").locked("insert.blockwise.eol") end,
          "Insert End of Line",
        },
      },
    },
  },
  {},
}

return M
