-- keybindings for lua

--vim.cmd [[nnoremap <C-c> :!g++ -o  %:r.out % -std=c++11<Enter>]]
--vim.cmd [[nnoremap <C-r> :!./%:r.out<Enter>]]

--keyindings for black hole register

vim.cmd [[nnoremap <leader>d "_dd]]

--keymaps for telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
