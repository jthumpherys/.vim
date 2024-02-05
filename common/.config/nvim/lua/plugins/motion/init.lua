return {
  {
    "andymass/vim-matchup",
    init = function()
      require("plugins.treesitter.utils").options.matchup = {
        enable = true,
        -- include_match_words = true,
      }

      vim.api.nvim_create_autocmd(
        "FileType",
        {
          pattern = {"typst"},
          callback = function()
            vim.b.match_words = "\\$:\\$"
          end,
        }
      )
    end,
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
    lazy = false,
  },
}
