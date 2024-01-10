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
      require("lint").linters_by_ft = opts
    end,
    init = function()
      vim.api.nvim_create_autocmd("filetype", {
        pattern = { "python" },
        callback = function(env)
          local lint = require("lint")
          vim.api.nvim_create_autocmd({"TextChanged", "BufWritePre"}, {
            callback = function() lint.try_lint() end,
            buffer = env.buf,
          })
          lint.try_lint()
        end,
      })
    end,
    ft = { "python" },
  },
}
