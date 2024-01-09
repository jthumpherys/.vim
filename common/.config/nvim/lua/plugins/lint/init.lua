return {
  {
    "nvimdev/guard.nvim",
    enabled = false,
    opts = {
      fmt_on_save = false,
      lsp_as_default_formatter = true,
    },
    config = function(_, opts)
      local ft = require("guard.filetype")
      ft("python"):fmt("ruff")
        :lint("mypy")
        :append("ruff")

      require("guard").setup(opts)
    end,
    dependencies = { "nvimdev/guard-collection" },
    ft = { "python" },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      python = { "mypy", "ruff" },
    },
    config = function(_, opts)
      local lint = require("lint")
      lint.linters_by_ft = opts
      vim.api.nvim_create_autocmd("TextChanged", {
        callback = function() lint.try_lint() end,
      })
      lint.try_lint()
    end,
    ft = { "python" },
  },
}
