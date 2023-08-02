return {
  "epwalsh/obsidian.nvim",
  opts = {
    dir = "~/vault",
    notes_sibdir = "notes",
    daily_notes = {
      folder = "notes/daily",
      date_format = "%y-%m-%d",
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
      new_notes_location = "notes_subdir",
    },
    templates = {
      subdir = "templates",
      date_format = "%d %b %Y",
      time_format = "%H:%M %Z",
    },
    follow_url_func = function(url) vim.fn.jobstart({"xdg-open", url}) end,
  },
  config = require("plugins.obsidian.config").config_function,
  dependencies = {
    "treesitter",
    "plenary",
    "cmp",
    "telescope",
    "which-key",
  },
  event = { "BufReadPre " .. vim.fn.expand "~" .. "/vault/**.md" },
}
