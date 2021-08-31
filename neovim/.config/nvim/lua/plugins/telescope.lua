local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", {noremap = true, silent = true})
keymap("n", "<leader>fa", "<cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>", {noremap = true, silent = true})
keymap("n", "<leader>gf", "<cmd>lua require('telescope.builtin').git_files({show_untracked=true})<cr>", {noremap = true, silent = true})
keymap("n", "<leader>ft", "<cmd>lua require('telescope.builtin').treesitter()<cr>", {noremap = true, silent = true})
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').live_buffers()<cr>", {noremap = true, silent = true})
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", {noremap = true, silent = true})
