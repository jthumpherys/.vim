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
        -- "julia",
        "kdl",
        -- "kotlin",
        "latex",
        "lua",
        "luadoc",
        "make",
        "markdown",
        "markdown_inline",
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
        additional_vim_regex_highlighting = { "markdown" },
      },
      indent = { enable = true },

      context_commentstring = {
        enable = true,
        enable_autcmd = false,
      },

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
    end,
    main = "nvim-treesitter.configs",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      { "nvim-treesitter/playground", name = "ts-playground" },
      { "JoosepAlviste/nvim-ts-context-commentstring" },
      { "RRethy/nvim-treesitter-endwise" },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    name = "ts-textobjects",
    dependencies = { "treesitter" },
  }
}
