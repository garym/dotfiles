local set = vim.opt

vim.cmd "syntax enable"

set.wrap = false
set.encoding = "utf-8"
set.fileencoding = "utf-8"

set.cursorline = true
set.ruler = true
set.relativenumber = true
set.number = true

set.splitbelow = true
set.splitright = true

set.tabstop = 2
set.shiftwidth = 2
set.smarttab = true
set.expandtab = true
set.smartindent = true
set.autoindent = true

set.showtabline = 2
set.laststatus = 2

set.hidden = true

set.termguicolors = true

vim.cmd [[
  :nnoremap <Tab> :bnext!<CR>
  :nnoremap <S-Tab> :bprevious!<CR>
  :nnoremap <C-K> :bp<bar>sp<bar>bn<bar>bd<CR>
]]
