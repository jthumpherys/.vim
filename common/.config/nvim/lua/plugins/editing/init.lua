local map = require("plugins.editing.keymaps")

return {
  {
    "numToStr/Comment.nvim",
    name = "comment",
    opts = function()
      return {
        mappings = {
          basic = false,
          extra = false,
        },
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        ignore = '^$',  -- ignore empty lines
      }
    end,
    config = true,
    init = require("plugins.whichkey.utils").add(map.comment),
    event = "VeryLazy"
  },

  {
    "willothy/moveline.nvim",
    build = "make",
    keys = {
      { '<C-j>', function() require("moveline").down() end, desc = "Move line down" },
      { '<C-k>', function() require("moveline").up() end, desc = "Move line up" },

      { '<C-j>', function() require("moveline").block_down() end, mode = 'v', desc = "Move block down" },
      { '<C-k>', function() require("moveline").block_up() end, mode = 'v', desc = "Move block up" },
    },
  },

  {
    "kevinhwang91/nvim-ufo",
    config = true,
    init = function()
      vim.o.foldcolumn = '0'
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      require("plugins.lsp.language_servers").extend_capabilities(
        function()
          return {
            textDocument = {
              foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
              },
            },
          }
        end
      )

      require("plugins.whichkey.utils").add(map.ufo)
    end,
    dependencies = {
      "kevinhwang91/promise-async"
    },
  },
}
