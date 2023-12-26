M = {}

local function get_builtin(func, opts)
  return function()
    require("telescope.builtin")[func](opts)
  end
end

M.telescope = {
  {
    ['/'] = {
      name = "+search",
      ['/'] = { get_builtin("live_grep"), "Working Directory" },
      b = { get_builtin("live_grep", { grep_open_files = true }), "Open Buffers" },
      c = {
        name = "+under cursor",
        ['/'] = { get_builtin("grep_string"), "Working Directory" },
        b = { get_builtin("grep_string", { grep_open_files = true }), "Open Buffers" },
      },
      f = { get_builtin("current_buffer_fuzzy_find"), "Current Buffer (fuzzy)" },
      [':'] = { get_builtin("command_history"), "Commands" },
    },
    f = {
      name = "+files",
      f = { get_builtin("find_files"), "Find" },
      g = { get_builtin("git_files"), "Find Git" },
      a = { get_builtin("find_files", { hidden = true, no_ignore = true, no_ignore_parent = true }), "Find All" },
      p = { get_builtin("old_files"), "Find Previous" },
      b = { get_builtin("buffers"), "Find Buffers" },
    },
  },
  { prefix = '<leader>' },
}

M.prefixes = {}

for prefix, data in pairs(M.telescope[1]) do
  table.insert(M.prefixes, { '<leader>' .. prefix, desc = data.name or data[2] or "" })
end

return M
