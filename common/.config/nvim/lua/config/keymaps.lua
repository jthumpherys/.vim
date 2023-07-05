vim.keymap.set('i', 'jj', '<Esc>', {desc = "I don't like reaching for escape"})
vim.keymap.set('n', 's', '<c-w>', {desc = "Switch split windows rapidly"})
vim.keymap.set('n', 'g-', '<c-o>', {desc = "Return to previous position"})
vim.keymap.set('n', 'g_', '<c-i>', {desc = "Jump forward positions"})

-- local whichkey = require("which-key")

-- whichkey.register(
--   {
--     s = { "<cmd>lua require(\"which-key\").show(\"\23\", { mode = 'n', auto = true })<CR>", "Window" },
--   }
-- )
