local minpac = require('usermod.minpac')

minpac.use = function(add)
  minpac.init()

  add('k-takata/minpac', {type = 'opt'})

  -- themes
  add('shaunsingh/nord.nvim')
  add('cocopon/iceberg.vim')
  add('ayu-theme/ayu-vim')
  add('lukas-reineke/onedark.nvim')

  -- icons
  add('kyazdani42/nvim-web-devicons')

  -- statusline
  add('hoob3rt/lualine.nvim')

  -- better terminal support
  add('akinsho/toggleterm.nvim')

  -- indent guides
  add('lukas-reineke/indent-blankline.nvim')

  -- file explorer
  add('kyazdani42/nvim-tree.lua')

  -- telescope finder
  add('nvim-lua/popup.nvim')
  add('nvim-lua/plenary.nvim')
  add('nvim-telescope/telescope.nvim')

  -- treesitter
  add('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- git
  add('tpope/vim-fugitive')
  add('airblade/vim-gitgutter')


  -- linting
  add('neovim/nvim-lspconfig')

  -- other
  add('sheerun/vim-polyglot')
  add('jceb/vim-orgmode')
end

require('plugins.indent_blankline')
require('plugins.lualine')
require('plugins.nvim_lspconfig')
require('plugins.nvim_tree')
require('plugins.telescope')
require('plugins.toggleterm')

-- require('plugins.theme_onedark')
vim.cmd [[
  let ayucolor="dark"
  let ayucolor="light"
  let ayucolor="mirage"

  " colorscheme ayu
  colorscheme iceberg
  " colorscheme nord
]]
