return {
  {
    "mcauley-penney/tidy.nvim",
    name = "tidy",
    opts = {
      filetype_exclude = { "markdown", "diff" },
    },
    config = true,
    event = { "BufWritePre" },
  },
}
