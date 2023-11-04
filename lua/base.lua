vim.g.mapleader = " "

--vim.o.relativenumber = true

local opt = vim.opt

--colourscehemes
--vim.cmd.colorscheme "slate"
vim.cmd.colorscheme "gruvbox"
--vim.cmd.colorscheme 'melange'
--vim.cmd [[termguicolors = true]]

--disables the defaily status bar
vim.cmd [[
set noshowmode
set noruler
set laststatus=0
set noshowcmd
]]

opt.number = true
vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

opt.hlsearch = true
opt.incsearch = true

opt.mouse = 'a'
opt.clipboard:append('unnamedplus')

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.swapfile = false
opt.autoread = true
vim.bo.autoread = true

opt.signcolumn = 'yes'
opt.list = true

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 300
        })
    end
})


opt.updatetime = 300
opt.timeoutlen = 500
