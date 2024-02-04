return {
  {
    "mcauley-penney/tidy.nvim",
    name = "tidy",
    opts = {
      filetype_exclude = { "diff", "markdown" },
    },
    config = true,
    event = { "BufWritePre" },
  },

  {
    "nmac427/guess-indent.nvim",
    config = true,
    event = { "BufReadPre", "BufNewFile" },
  },

  {
    "tenxsoydev/tabs-vs-spaces.nvim",
    config = true,
    event = { "BufReadPost", "BufNewFile" },
  },
}
