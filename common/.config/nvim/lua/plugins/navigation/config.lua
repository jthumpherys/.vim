local M = {}

function M.illuminate_config_function(_, opts)
  vim.cmd[[hi def IlluminatedWordText gui=underline]]
  local illuminate = require("illuminate")
  illuminate.configure(opts)
  require("which-key").register(
    {
      ['<c-n>'] = { illuminate.goto_next_reference, "Go to next instance of word" },
      ['<c-p>'] = { illuminate.goto_prev_reference, "Go to previous instance of word" },
    }
  )
end

return M
