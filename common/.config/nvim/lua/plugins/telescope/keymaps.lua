local M = {}

M.telescope = {
  { '<leader>/', group = "search" },
  { '<leader>//', "live_grep", desc = "Working Directory" },
  { '<leader>/b', { "live_grep", {grep_open_files = true} }, desc = "Open Buffers" },
  { '<leader>/f', "current_buffer_fuzzy_find", desc = "Current Buffer (fuzzy)" },
  { '<leader>/:', "command_history", desc = "Commands" },

  { '<leader>/c', group = "under cursor" },
  { '<leader>/c/', "grep_string", desc = "Working Directory" },
  { '<leader>/cb', { "grep_string", {grep_open_files = true} }, desc = "Open Buffers" },

  { '<leader>f', group = "files" },
  { '<leader>ff', "find_files", desc = "Find" },
  { '<leader>fg', "git_files", desc = "Find Git" },
  {
    '<leader>fa',
    { "find_files", { hidden = true, no_ignore = true, no_ignore_parent = true } },
    desc = "Find All",
  },
  { '<leader>fp', "old_files", desc = "Find Previous" },
  { '<leader>fb', "buffers", desc = "Find Buffers" },
  { '<leader>fz', "extensions.zoxide.list", desc = "Zoxide" },
}

for _, item in pairs(M.telescope) do
  local fn = item[2]
  if type(fn) == "string" then
    item[2] = function() return require("telescope.builtin")[fn]() end
  elseif type(fn) == "table" then
    item[2] = function() return require("telescope.builtin")[fn[1]](fn[2]) end
  end
end

return M
