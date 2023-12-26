return {
  {
    "nvim-treesitter/nvim-treesitter",
    name = "treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed = {
        "arduino",
        "bash",
        "c",
        "cmake",
        "cpp",
        -- "comment", -- maybe slow? TODO: test
        "css",
        "dart",
        "diff",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "haskell",
        "html",
        "hypr",
        "ini",
        "javascript",
        "json",
        "json5",
        "julia",
        "kdl",
        "kotlin",
        "latex",
        "lua",
        "luadoc",
        "make",
        "markdown",
        "markdown_inline",
        "matlab",
        "ocaml",
        "passwd",
        "python",
        "regex",
        "requirements",  -- pip
        "rust",
        "scss",
        "toml",
        "typescript",
        "vim",
        "vimdoc",
        "xcompose",
        "yaml",
      },
      auto_install = false,
      highlight = {
        enable = true,
      },
    },
    -- init = function(plugin)
    --   -- maybe use this to load certain capabilities at startup if plugins are using them without `require`
    --   require("lazy.core.loader").add_to_rtp(plugin)
    --   require("nvim-treesitter.query_predicates")
    -- end,
    cmd = {
      "TSInstall",
      "TSUpdate",
      "TSUpdateSync",
    },
    event = "VeryLazy",
  },

  {
    "luckasRanarison/tree-sitter-hypr",
    init = function()
      vim.filetype.add(
        {
          pattern = {
            [".*/hypr/.*%.conf"] = "hypr",
          },
        }
      )

      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.hypr = {
        install_info = {
          url = "https://github.com/luckasRanarison/tree-sitter-hypr",
          files = { "src/parser.c" },
          branch = "master",

          generate_required_npm = false,
          requires_generate_from_grammer = false,
        },
        filetype = "hypr",
      }
    end,
    ft = "hypr",
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = {
      enable_autocmd = false,
    },
    init = function()
      vim.g.skip_ts_context_commentstring_module = true
    end,
  },
}
