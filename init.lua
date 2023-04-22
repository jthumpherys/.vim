
vim.cmd('source $HOME/config/.vimrc')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


local Plug = vim.fn['plug#']

local plug_path = vim.call('stdpath', 'data') .. '/plugged'

vim.call('plug#begin', plug_path)

Plug 'junegunn/vim-plug'

Plug('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn['TSUpdate#']})

Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', {tag = '0.1.1'})

Plug 'nvim-tree/nvim-tree.lua'

Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'EdenEast/nightfox.nvim'

vim.call('plug#end')


for plug in pairs(vim.g.plugs) do
  local ok, err = os.rename(plug_path .. '/' .. plug, plug_path .. '/' .. plug)
  if not ok then
    vim.cmd('PlugInstall')
    print(plug)
    break
  end
end

-- vim.cmd('PlugUpdate')


-- nvim-treesitter setup
require("nvim-treesitter.configs").setup {
  ensure_installed = { "bash", "cpp", "json", "make", "python", "vim" },

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

