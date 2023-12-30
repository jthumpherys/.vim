return {
  {
    "sitiom/nvim-numbertoggle",
    name = "numbertoggle",
    init = function()
      vim.opt.number = true
    end,
    event = { "BufReadPost", "BufNewFile" },
  },
}
