vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#E5C07B blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#56B6C2 blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD blend=nocombine]]

vim.opt.listchars = {
  space = '⋅',
  eol = '↴',
}

require("indent_blankline").setup {
  show_end_of_line = true,
  space_char_blankline = " ",
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
  },
}

vim.cmd [[
  augroup IndentBlanklineContextAutogroup
    autocmd!
    autocmd CursorMoved * IndentBlanklineRefresh
  augroup END
]]
