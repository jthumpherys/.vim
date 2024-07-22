local M = {}

M.telescope = {
  module = "telescope",
  {
    module = "builtin",
    { '<leader>/', group = "search" },
    {
      fn = "live_grep",
      { '<leader>//', desc = "Working Directory" },
      { '<leader>/b', args = {grep_open_files = true}, desc = "Open Buffers" },
    },
    { '<leader>/f', fn = "current_buffer_fuzzy_find", desc = "Current Buffer (fuzzy)" },
    { '<leader>/:', fn = "command_history", desc = "Commands" },

    { '<leader>/c', group = "under cursor" },
    {
      fn = "grep_string",
      { '<leader>/c/', desc = "Working Directory" },
      { '<leader>/cb', args = {grep_open_files = true}, desc = "Open Buffers" },
    },

    { '<leader>f', group = "files" },
    {
      fn = "find_files",
      { '<leader>ff', desc = "Find" },
      {
        '<leader>fa',
        args = { hidden = true, no_ignore = true, no_ignore_parent = true },
        desc = "Find All",
      },
    },
    { '<leader>fg', fn = "git_files", desc = "Find Git" },
    { '<leader>fp', fn = "oldfiles", desc = "Find Previous" },
    { '<leader>fb', fn = "buffers", desc = "Find Buffers" },
  },
  { '<leader>fz', fn = { "extensions", "zoxide", "list" }, desc = "Zoxide" },
}

return M
