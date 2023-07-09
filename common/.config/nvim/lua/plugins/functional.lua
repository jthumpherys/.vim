return {
  {
    "kevinhwang91/nvim-ufo",
    name = "ufo",
    config = true,
    init = function()
      vim.o.signcolumn = "yes:1"
      vim.o.foldcolumn = '0' -- '1'
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
    event = { "BufReadPost", "BufNewFile" },
    keys = 'z',
    -- keys = {
    --   { 'n', 'zR', require("ufo").openAllFolds },
    --   { 'n', 'zM', require("ufo").closeAllFolds },
    -- },
    dependencies = { "kevinhwang91/promise-async" },
  },

  {
    "mcauley-penney/tidy.nvim",
    name = "tidy",
    opts = {
      filetype_exclude = { "markdown", "diff" },
    },
    config = true,
    event = { "BufWritePre" },
  },

  {
    "sindrets/diffview.nvim",
    name = "diffview",
    opts = {
      enhanced_diff_hl = true,
    },
    dependencies = { "plenary", "devicons" },
    cmd = { "DiffviewFileHistory", "DiffviewOpen" },
  },
}
