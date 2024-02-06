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
          -- "<Plug>()"
          function() return require("Comment.api").call("toggle.linewise.current", 'g@$')() end,
          -- function()
          --   vim.o.operatorfunc = "v:lua.require('Comment.api').locked('toggle.linewise.current')()"
          --   require("Comment.api").locked("toggle.linewise.current")(unpack(arg))
          -- end,
          "Current Line",
          expr = true,
        },
        o = {
          function() require("Comment.api").insert.linewise.above() end,
          "Insert Previous Line",
        },
        O = {
          function() require("Comment.api").insert.linewise.below() end,
          "Insert Next Line",
        },
        A = {
          function() require("Comment.api").locked("insert.linewise.eol")(unpack(arg)) end,
          "Insert End of Line"
        },
      },
      ['<leader>b'] = {
        c = {
          function() require("Comment.api").locked("toggle.blockwise.current")(unpack(arg)) end,
          "Current Line",
        },
        o = {
          function() require("Comment.api").insert.blockwise.above() end,
          "Insert Previous Line",
        },
        O = {
          function() require("Comment.api").insert.blockwise.below() end,
          "Insert Next Line",
        },
        A = {
          function() require("Comment.api").locked("insert.blockwise.eol")(unpack(arg)) end,
          "Insert End of Line",
        },
      },
    },

    -- Visual Mode
    {
      ['<leader>c'] = {
        function()
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false)
          require("Comment.api").locked("toggle.linewise")(vim.fn.visualmode())
        end,
        "Comment Toggle",
        mode = 'x',
      },
      ['<leader>b'] = {
        function()
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false)
          require("Comment.api").locked("toggle.blockwise")(vim.fn.visualmode())
        end,
        "Comment Block Toggle",
        mode = 'x',
      },
    },
  },
  {},
}

M.surround = {
  {
    {
      ['<leader>'] = {
        s = {
          function()
            require("nvim-surround").insert_surround({ line_mode=false })
          end,
          "Surround",
        },
        S = {
          function()
            require("nvim-surround").insert_surround({ line_mode=true }) end,
          "Surround on New Lines",
        },
      },
    },
    {
      ['<leader>s'] = {
        -- s = {
        --   require("nvim-surround").n,
        --   "Current Line",
        -- },
        c = { "<Plug>(nvim-surround-change)", "Change" },
        d = { "<Plug>(nvim-surround-delete)", "Delete" },
      },
      ['<leader>S'] = {
        S = { "<Plug>(nvim-surround-normal-cur-line)", "Current Line" },
        c = { "<Plug>(nvim-surround-change-line)", "Change" },
      },
    },
    {
      s = { "<Plug>(nvim-surround-visual)", "Surround", mode='v' },
      S = { "<Plug>(nvim-surround-visual-line)", "Surround", mode='v' },
    },
  },
  {},
}
M.surround_operators = { ['<leader>s'] = "Surround", ['<leader>S'] = "Surround on New Lines" }
M.surround_keys = { {'<leader>s'}, {'<leader>S'}, { 's', mode='v' }, { 'S', mode='v' } }

return M
