return {
  {
    "cloudsftp/peek.nvim",
    event = { "BufReadPre", "BufNewFile" },
    build = "deno task --quiet build:fast",
  },

  {
    "jghauser/follow-md-links.nvim",
    enabled = false,
    dependencies = { "treesitter" },
  },

  {
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
    config = function(_, opts)
      local obsidian = require("obsidian")
      obsidian.setup(opts)
      require("which-key").register(
        {
          ['gf'] = { --"<cmd>ObsidianFollowLink<CR>", "Follow Obsidian link" }
            function()
              if obsidian.util.cursor_on_markdown_link() then
                vim.cmd("ObsidianFollowLink")-- "<cmd>ObsidianFollowLink<CR>"
              else vim.api.nvim_feedkeys('gf', 'n', true) end end,
            "Follow Obsidian link" },
        }
      )
    end,
    dependencies = {
      "treesitter",
      "plenary",
      "cmp",
      "telescope",
      "which-key",
    },
    event = { "BufReadPre " .. vim.fn.expand "~" .. "/vault/**.md" },
  },
}
