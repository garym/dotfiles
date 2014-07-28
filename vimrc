set encoding=utf-8
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Vundle help
" ===========
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Bundle 'laurilehmijoki/haskellmode-vim'
Bundle 'altercation/vim-colors-solarized.git'

filetype plugin indent on     " required!

set nowrap
syntax enable
set term=screen-256color
set t_Co=256
" to make screen-256color work:
map <Esc>OH <Home>
map! <Esc>OH <Home>
map <Esc>OF <End>
map! <Esc>OF <End>
set background=dark
"colorscheme solarized
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

augroup vimrc_autocmds
    autocmd!
    " hightlight characters past col 79
    autocmd FileType python highlight Excess ctermbg=Red guibg=White
    autocmd FileType python match Excess /\%79v.*/
    autocmd FileType python set nowrap
    autocmd FileType python set rnu
augroup END

nmap <leader>l :set list!<CR>
set listchars=tab:»\ ,eol:¬

" automatically change window's cwd to file's dir
set autochdir

" I'm prefer spaces to tabs
set tabstop=4
set shiftwidth=4
set expandtab
"  more subtle popup colors
if has ('gui_running')
    highlight Pmenu guibg=#cccccc gui=bold
    endif

"Powerline setup
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
" set
" rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/

set laststatus=2
set t_Co=256
map <F2> :NERDTreeToggle<CR>

let g:pymode_rope = 0

"" Documentation
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'

" Linting
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
" Auto check on save
let g:pymode_lint_on_fly = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

let g:pymode_utils_whitespaces = 0

