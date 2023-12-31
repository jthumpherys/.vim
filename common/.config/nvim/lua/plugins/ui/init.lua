return {
  {
    "sitiom/nvim-numbertoggle",
    name = "numbertoggle",
    event = { "BufReadPost", "BufNewFile" },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    name = "indent",
    main = "ibl",
    opts = {
      indent = {
        char = "▏",
      },
      scope = {
        char = "▎",
        show_start = false,
        show_end = false,
        highlight = "Label",
        exclude = { language = { "toml" }, },
      },
    },
    config = true,
    version = "*",
    event = { "BufReadPost", "BufNewFile" },
  },
}
