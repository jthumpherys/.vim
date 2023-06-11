return {
  {
    "theRealCarneiro/hyprland-vim-syntax",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = "hypr",
  },

  {
    "imsnif/kdl.vim",
    ft = "kdl",
  },

  {
    "Fymyte/rasi.vim",
    ft = "rasi",
    build = ":TSInstall rasi",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
}
