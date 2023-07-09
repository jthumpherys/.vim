return {
  {
    "SirVer/ultisnips",
    name = "ultisnips",
    init = function()
      vim.g.python3_host_prog = "/usr/bin/python3"
    end,
    -- config = function()
    --   vim.g.UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
    --   vim.g.UltiSnipsJumpForwardTrigger = "<Plug>(ultisnips_jump_forward)"
    --   vim.g.UltiSnipsJumpBackwardTrigger = "<Plug>(ultisnips_jump_backward)"
    --   vim.g.UltiSnipsListSnippets = "<C-x><C-s>"
    --   vim.g.UltiSnipsRemoveSelectModeMappings = 0
    -- end,
    dependencies = { "honza/vim-snippets" },
  },
}
