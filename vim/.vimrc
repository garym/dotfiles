set nocompatible
filetype off " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle (required)
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'klen/python-mode'
Plugin 'kien/ctrlp.vim'

call vundle#end()


filetype plugin indent on

set nowrap
syntax enable
set term=screen-256color

map <Esc>OH <Home>
map! <Esc>OH <Home>
map <Esc>OF <End>
map! <Esc>OF <End>

augroup vimrc_autocmds
  autocmd!
  autocmd FileType python highlight Excess ctermbg=DarkRed guibg=Black
  autocmd FileType python match Excess /\%80v.*/
  autocmd FileType python set nowrap
augroup END

map <F2> :NERDTreeToggle<CR>

let g:pymode_rope = 0
let g:pymode_lint = 1
let g:pymode_lintchecker = "pyflakes,pep8"
let g:pymode_lint_writer = 1
let g:pymode_virtualenv = 1

let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

let g:pymode_folding = 0

nmap <leader>l :set list!<CR>
set tabstop=4
set shiftwidth=4
set expandtab


let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2
set t_Co=256
