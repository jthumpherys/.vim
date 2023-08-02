local M = {}

function M.config_function(_, opts)
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
end

return M
