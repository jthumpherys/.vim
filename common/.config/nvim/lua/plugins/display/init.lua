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
    event = "VeryLazy",
    dependencies = { "kevinhwang91/promise-async" },
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
