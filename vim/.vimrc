set nocompatible
syntax on
set nowrap
set encoding=utf8

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
set background=dark

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
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %code%: %s [%severity%]'
let g:ale_set_highlights = 0
let g:ale_sign_column_always = 1

let g:ale_python_auto_pipenv = 1
let g:ale_python_mypy_auto_pipenv = 1

let g:ale_completion_enabled = 1
let g:ale_linters = {
	\   'python': ['flake8'],
	\}

"set completeopt-=preview

let g:jedi#popup_on_dot = "0"
let g:jedi#show_call_signatures = "0"
let g:jedi#use_splits_not_buffers = "left"

"""""""""""""""
" Key Mappings
"""""""""""""""

map <F3> :TagbarToggle<CR>
map <F8> :TagbarOpenAutoClose<CR>


" Omnicomplete Better Nav
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

nnoremap <Leader>O :CtrlP<CR>
nmap <leader>l :set list!<CR>

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsListSnippets='<c-tab>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" Nerdtree configuration
map <F2> :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']
let NERDTreeShowHidden=1
autocmd VimEnter * NERDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Switching between buffers
" Set commands to switching between buffers
:nnoremap <Tab> :bnext!<CR>
:nnoremap <S-Tab> :bprevious!<CR>
:nnoremap <C-X> :bp<bar>sp<bar>bn<bar>bd<CR>

map <C-p> :Files<CR>
