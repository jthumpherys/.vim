return {
  -- {
  --   "theRealCarneiro/hyprland-vim-syntax",
  --   dependencies = { "treesitter" },
  --   ft = "hypr",
  -- },

  {
    "luckasRanarison/tree-sitter-hypr",
    ft = "hypr",
    config = function() require("Comment.ft").set("hypr", '#%s') end,
    init = function()
      vim.filetype.add(
        {
          pattern = {
            [".*/hypr/.*%.conf"] = "hypr",
          },
        }
      )
    end
  },

  {
    "imsnif/kdl.vim",
    ft = "kdl",
  },

  {
    "Fymyte/rasi.vim",
    build = ":TSInstall rasi",
    dependencies = { "treesitter" },
    ft = "rasi",
  },
}
