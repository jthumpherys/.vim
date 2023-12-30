return {
  {
    "sitiom/nvim-numbertoggle",
    name = "numbertoggle",
    init = function()
      require("utils").log("here")
      vim.opt.number = true
    end,
    event = { "BufReadPost", "BufNewFile" },
  },
}
