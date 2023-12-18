return {
  {
    "nvim-treesitter/nvim-treesitter",
    name = "treesitter",
    opts = {
      ensure_installed = {
        "arduino",
        "bash",
        "cpp",
        "css",
        -- "dart",
        "diff",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "html",
        "hypr",
        "json",
        "json5",
        "julia",
        "kdl",
        -- "kotlin",
        "latex",
        "lua",
        "luadoc",
        "make",
        "markdown",
        "markdown_inline",
        "matlab",
        "passwd",
        "python",
        "regex",
        "rust",
        "scss",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
      },
      sync_install = false,
      auto_install = false,
      highlight = {
        enable = true,
        disable = { "latex" },
        additional_vim_regex_highlighting = { "markdown" },
      },
      indent = { enable = true },

      playground = {
        enable = true,
        disable = {},
        keybindings = {},
      },

      endwise = {
        enable = true,
      },
    },
    config = function(_, opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.hypr = {
        install_info = {
          url = "https://github.com/luckasRanarison/tree-sitter-hypr",
          files = { "src/parser.c" },
          branch = "master",
        },
        filetype = "hypr",
      }

      require("nvim-treesitter.configs").setup(opts)

      vim.treesitter.language.register("matlab", "octave")
    end,
    -- main = "nvim-treesitter.configs",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      { "nvim-treesitter/playground", name = "ts-playground" },
      -- "context_commentstring",
      { "RRethy/nvim-treesitter-endwise" },
    },
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    name = "context_commentstring",
    main = "ts_context_commentstring",
    -- setup = function() vim.g.ts_skip_ = false end,
    opts = {
      enable_autocmd = false,
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    name = "ts-textobjects",
    dependencies = { "treesitter" },
  }
}
