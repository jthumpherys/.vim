
vim.cmd('source $HOME/config/.vimrc')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


local Plug = vim.fn['plug#']

local plug_path = vim.call('stdpath', 'data') .. '/plugged'

vim.call('plug#begin', plug_path)

Plug 'junegunn/vim-plug'

Plug('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn['TSUpdate#']})
Plug 'nvim-treesitter/playground'

-- fuzzy search ig?
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

-- directory tree
Plug 'nvim-tree/nvim-tree.lua'

-- colorschemes
Plug 'EdenEast/nightfox.nvim'

-- indention markers
Plug 'lukas-reineke/indent-blankline.nvim'

-- highlight matching keywords under cursor
Plug 'RRethy/vim-illuminate'

-- absolute/relative line number toggling
Plug 'sitiom/nvim-numbertoggle'

-- current line highlighting
Plug 'mvllow/modes.nvim'

-- comment toggling
Plug 'terrortylor/nvim-comment'

-- status line
Plug 'nvim-tree/nvim-web-devicons'
Plug 'freddiehaddad/feline.nvim'

vim.call('plug#end')


vim.cmd("colorscheme carbonfox")


-- nvim-treesitter setup
require("nvim-treesitter.configs").setup {
  ensure_installed = { "bash", "cpp", "json", "lua", "make", "python", "vim" },

  sync_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}


-- nvim-tree setup
vim.opt.termguicolors = true -- enable highlight groups
require("nvim-tree").setup {
  renderer = {
    highlight_git = true,
  },
}


-- indent-blankline setup
require("indent_blankline").setup {
  show_current_context = true,
}


-- illuminate configuration
require('illuminate').configure {
  providers = {'treesitter'},

  modes_allowlist = {'n'},

  min_count_to_highlight = 2,
}


require('modes').setup()
require('nvim_comment').setup()

