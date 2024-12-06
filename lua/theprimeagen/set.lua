--vim.opt.guicursor = ""


vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.cmd[[set noshowmode
set noruler
set laststatus=0
set noshowcmd]]

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.cmd[[set clipboard=unnamedplus]]

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

--tmux stuff
vim.cmd[[autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window '" . expand("%:t") . "'")
autocmd VimLeave * call system("tmux setw automatic-rename")
]]

--this does stuff, don't delete it bruh
vim.cmd[[
set encoding=utf8
let g:airline_powerline_fonts = 1
]]

-- Vimtex settings
vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'zathura'         -- Replace 'zathura' with your PDF viewer
vim.g.vimtex_compiler_method = 'latexmk'

-- Key mappings for Vimtex commands
vim.keymap.set('n', '<leader>ll', '<cmd>VimtexCompile<CR>', { desc = 'Start Vimtex compile' })
vim.keymap.set('n', '<leader>lv', '<cmd>VimtexView<CR>', { desc = 'View compiled PDF' })
vim.keymap.set('n', '<leader>lk', '<cmd>VimtexStop<CR>', { desc = 'Stop Vimtex compile' })
