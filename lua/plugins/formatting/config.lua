local util = require("formatter.util")

local M = {}

M.options = {
  logging = true,
  log_level = vim.log.levels.WARN,

  filetype = {
    bash = {
      require("formatter.filetypes.bash").beautysh,
      {
        exe = "beautysh",
      },
    },
    cpp = {},
    lua = {
      require("formatter.filetypes.lua").stylua,
      {
        exe = "stylua",
        args = {
          "--search-parent-directories",
          "--stdin-filepath",
          util.escape_path(util.get_current_buffer_file_path()),
          "--",
          "-",
        },
        stdin = true,
      },
    },
    make = {},
    python = {
      {
        require("formatter.filetypes.python").autoflake,
        {
          exe = "autoflake",
        },
      },
      {
        require("formatter.filetypes.python").black,
        {
          exe = "black",
          args = {
            "--line-length=95",
          },
        },
      },
      {
        require("formatter.filetypes.python").isort,
        {
          exe = "isort",
          args = {
            "--profile black",
            "-l 95",
          },
        },
      },
    },
  },
}

return M
