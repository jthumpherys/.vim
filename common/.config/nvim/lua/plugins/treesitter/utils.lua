M = {}

M.options = {
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
    "rasi",
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
  indent = {
    enable = true,
    disable = { "typst" },
  },
}

function M.get_options()
  return M.options
end

return M
