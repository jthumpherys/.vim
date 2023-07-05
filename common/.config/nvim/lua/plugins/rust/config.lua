local M = {}

function M.on_attach(_, bufnr)
  print("here")
  local rt = require("rust-tools")



  -- local keymaps = require("plugins.lsp.keymaps").keymaps
  -- keymaps["<leader>l"].j = { rt.move_item.move_item(false), "Move item down" }
  -- keymaps["<leader>l"].k = { rt.move_item.move_item(true), "Move item up" }
  -- keymaps.J = { "<cmd>RustJoinLines<CR>", "Join next line" }
  -- keymaps.K = { rt.hover_actions.hover_actions, "Hover action" }

  require("which-key").register({
    -- J = { "<cmd>RustJoinLines<CR>", "Join next line" },
    -- K = { rt.hover_actions.hover_actions, "Hover action" },
    ["<leader>l"] = {
      name = "LSP",
      j = { rt.move_item.move_item(false), "Move item down" },
      k = { rt.move_item.move_item(true), "Move item up" },
    },
  }, {buffer = bufnr})
  -- keymaps = vim.tbl_deep_extend("keep", keymaps, require("plugins.lsp.keymaps").keymaps)
  -- print(keymaps)
  -- require("which-key").register(keymaps, { buffer = bufnr })

  rt.inlay_hints.enable()
end

return M
