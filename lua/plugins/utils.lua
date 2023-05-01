return {
  {
    "nvim-lua/plenary.nvim",
    name = "plenary",
  },

  {
    "nvim-tree/nvim-web-devicons",
    name = "devicons",
    config = function()
      require("nvim-web-devicons").setup()
    end,
  },
}
