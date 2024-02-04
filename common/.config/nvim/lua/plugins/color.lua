return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      on_highlights = function(hl, c)
        -- hl.CursorLineNr = {
        --   bg = c.bg_highlight,
        -- }
        hl.CursorLineSign = {
          bg = c.bg_highlight,
        }
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd[[colorscheme tokyonight]]
    end
  },
}
