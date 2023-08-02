local config = require("plugins.completion.config")
local sources = require("plugins.completion.sources")

return {
  {
    "hrsh7th/nvim-cmp",
    name = "cmp",
    opts = {
      preselect = "None",
      snippet = { expand = function(args) vim.fn["UltiSnips#Anon"](args.body) end },
      mapping = {
        ['<tab>'] = {
          loc = "ultisnips",
          fn = "compose",
          args = { "select_next_item", "jump_forwards" },
        },
        ['<S-tab>'] = {
          loc = "ultisnips",
          fn = "compose",
          args = { "select_prev_item", "jump_backwards" },
        },
        ['<CR>'] = { loc = "local", fn = "confirm", args = { select = false } },
        ['<C-b>'] = { loc = "local", fn = "scroll_docs", args = -4 },
        ['<C-f>'] = { loc = "local", fn = "scroll_docs", args = 4 },
        ['<C-e>'] = { loc = "local", fn = "abort" },
      },
      sorting = {
        comparators = {
          { loc = "local", fn = "offset" },
          { loc = "local", fn = "exact" },
          { loc = "local", fn = "score" },
          { loc = "cmp-under-comparator", fn = "under" },
          { loc = "local", fn = "kind" },
          { loc = "local", fn = "sort_text" },
          { loc = "local", fn = "length" },
          { loc = "local", fn = "order" },
        },
      },
      sources = sources.sources,
    },
    config = config.config_function,
    dependencies = sources.get_dependencies(
      {
        "lspconfig",
        "quangnguyen30192/cmp-nvim-ultisnips",
        "lukas-reineke/cmp-under-comparator",
        "pairs",
      }
    ),
    event = { "CmdlineEnter", "InsertEnter" },
  },

  {
    "SirVer/ultisnips",
    name = "ultisnips",
    init = function()
      vim.g.python3_host_prog = "/usr/bin/python3"
    end,
    dependencies = { "honza/vim-snippets" },
  },

  {
    "windwp/nvim-ts-autotag",
    name = "autotag",
    enabled = false,
  },

  {
    "windwp/nvim-autopairs",
    name = "pairs",
    opts = {
      disable_in_visualblock = true,
      enable_check_bracket_line = true,
      check_ts = true,
    },
    config = config.pairs_config_function,
    event = "InsertEnter",
  },
}
