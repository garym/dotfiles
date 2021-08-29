local minpac = require('usermod.minpac')

minpac.use = function(add)
  minpac.init()

  add('k-takata/minpac', {type = 'opt'})

  add('hoob3rt/lualine.nvim')
  add('kyazdani42/nvim-web-devicons')

  add('kyazdani42/nvim-tree.lua')

  add('shaunsingh/nord.nvim')
  add('cocopon/iceberg.vim')
  add('ayu-theme/ayu-vim')

  add('dense-analysis/ale')
  add('preservim/tagbar')
  add('davidhalter/jedi-vim')
  add('SirVer/ultisnips')
  add('tpope/vim-fugitive')
  add('sheerun/vim-polyglot')
  add('ludovicchabant/vim-gutentags')
  add('airblade/vim-gitgutter')
  add('ctrlpvim/ctrlp.vim')
  add('jceb/vim-orgmode')
  add('akinsho/toggleterm.nvim')
end
