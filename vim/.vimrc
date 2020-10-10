set nocompatible
syntax on
set nowrap
set encoding=utf8

""""""""""""""""""""""
" START Vundle Config
""""""""""""""""""""""

filetype off " required for Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle (required)
Plugin 'VundleVim/Vundle.vim'

" Utility Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'

" Generic Programming Support
Plugin 'universal-ctags/ctags'
Plugin 'vim-syntastic/syntastic'
Plugin 'dense-analysis/ale'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'

" Git Support
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Python Support
"Plugin 'python-mode/python-mode'
"#Plugin 'ambv/black'

" Openscad support
"Plugin 'sirtaj/vim-openscad'

" Theme / Interface
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-scripts/CycleColor'

Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'christophermca/meta5'
Plugin 'tomasiser/vim-code-dark'

call vundle#end() " (required)
filetype plugin indent on " (required)

""""""""""""""""""""
" END Vundle Config
""""""""""""""""""""

" Line number related config
set number
set relativenumber
set ruler

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" 'Fix' default split creation directions
set splitright
set splitbelow

" Always display status line
set laststatus=2

" Enable highlighting of current line
set cursorline

" Theme and Styling
set t_Co=256
set t_ut=
"set background=dark

if (has("termguicolors"))
    set termguicolors
    let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
    let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
endif

colorscheme codedark

let g:airline_theme = 'codedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1

let g:ale_warn_about_trailing_whitespace = 1
let g:ale_echo_msg_format = '[%linter%] %code%: %s [%severity%]'
let g:ale_set_highlights = 0
let g:ale_sign_column_always = 1

let g:ale_python_auto_pipenv = 1
let g:ale_python_mypy_auto_pipenv = 1

"set completeopt-=preview

let g:jedi#popup_on_dot = "0"
let g:jedi#show_call_signatures = "0"
let g:jedi#use_splits_not_buffers = "left"

"""""""""""""""
" Key Mappings
"""""""""""""""

map <F2> :NERDTreeToggle<CR>
map <F3> :TagbarToggle<CR>
map <F8> :TagbarOpenAutoClose<CR>

" Omnicomplete Better Nav
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

nnoremap <Leader>O :CtrlP<CR>
nmap <leader>l :set list!<CR>
