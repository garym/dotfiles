require("toggleterm").setup{
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 1,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'curved',
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}

local Terminal  = require('toggleterm.terminal').Terminal

local top = Terminal:new({
  cmd = "command -v htop 2>&1 /dev/null && htop || top",
  hidden = true,
  shell = vim.o.shell, -- change the default shell
  direction = "float",
  float_opts = {
    border = 'curved',
    winblend = 0,
  },
})

function _top_toggle()
  top:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>lua _top_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<leader>tt", "<cmd>lua _top_toggle()<CR>", {noremap = true, silent = true})
