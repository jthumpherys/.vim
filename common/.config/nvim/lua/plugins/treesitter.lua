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
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = {
      enable_autocmd = false,
    },
    init = function()
      vim.g.skip_ts_context_commentstring_module = true
    end,
  },
}
