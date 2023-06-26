M = {}

function M.on_attach(_, bufnr)
  local rt = require("rust-tools")
  local keymaps = {
    J = { "<cmd>RustJoinLines<CR>", "Join next line" },
    K = { rt.hover_actions.hover_actions, "Hover action" },
    ["<leader>l"] = {
      name = "LSP",
      j = { rt.move_item.move_item(false), "Move item down" },
      k = { rt.move_item.move_item(true), "Move item up" },
    },
  }
  vim.tbl_deep_extend("keep", keymaps, require("plugins.lsp.language_servers").keymaps)
  require("which-key").register(keymaps, { buffer = bufnr })

  rt.inlay_hints.enable()
end

return M
