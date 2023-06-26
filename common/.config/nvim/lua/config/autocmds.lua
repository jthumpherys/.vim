-- vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
--   pattern = {},
--   callback = function()
--     vim.opt.expandtab = false
--   end,
-- })

-- vim.api.nvim_create_autocmd("BufWritePost", { pattern = "*.snippets", callback = "CmpUltisnipsReloadSnippets" })
