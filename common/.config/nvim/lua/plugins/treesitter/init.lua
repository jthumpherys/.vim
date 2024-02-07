local utils = require("plugins.treesitter.utils")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    name = "treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = utils.get_options(),
    init = function(plugin)
      require("lazy.core.loader").add_to_rtp(plugin)
      require("nvim-treesitter.query_predicates")

      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      vim.opt.foldenable = false
    end,
    cmd = {
      "TSInstall",
      "TSUpdate",
      "TSUpdateSync",
    },
    event = "VeryLazy",
    dependencies = {
      {
        "RRethy/nvim-treesitter-endwise",
        init = function() utils.options.endwise = { enable = true } end,
      },
    },
  },

  {
    "luckasRanarison/tree-sitter-hyprlang",
    build = ":TSInstall hyprlang",
    init = function()
      vim.filetype.add(
        {
          pattern = {
            [".*/hypr/.*%.conf"] = "hyprlang",
          },
        }
      )
    end,
    ft = "hyprlang",
  },

  {
    "Fymyte/rasi.vim",
    build = ":TSInstall rasi",
    dependencies = { "treesitter" },
    ft = "rasi",
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = {
      enable_autocmd = false,
      languages = {
        kdl = "// %s",
      },
    },
    init = function()
      vim.g.skip_ts_context_commentstring_module = true
    end,
  },
}
