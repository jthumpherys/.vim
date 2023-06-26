return {
  {
    "theRealCarneiro/hyprland-vim-syntax",
    dependencies = { "treesitter" },
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
    dependencies = { "treesitter" },
  },
}
