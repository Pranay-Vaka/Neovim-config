--This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')
return require('packer').startup(function(use)
    -- Packer can manage itself

    use 'mhartington/formatter.nvim'
    use 'wbthomason/packer.nvim'
    use 'm4xshen/autoclose.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }


    use {
        'nvim-telescope/telescope.nvim',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use "rebelot/kanagawa.nvim"
    use "morhetz/gruvbox"
    use 'aktersnurra/no-clown-fiesta.nvim'
    use "rose-pine/neovim"
    use "Alexis12119/nightly.nvim"
    use "kvrohit/rasmus.nvim"
    use 'projekt0n/github-nvim-theme'
    use 'AlexvZyl/nordic.nvim'
    use 'bluz71/vim-moonfly-colors'
    use 'Mofiqul/vscode.nvim'
    use 'ribru17/bamboo.nvim'
    use 'mikesmithgh/gruvsquirrel.nvim'
    use {'nyoom-engineering/oxocarbon.nvim'}
    use 'lunacookies/vim-colors-xcode'
    use 'davidosomething/vim-colors-meh'
    use 'navarasu/onedark.nvim'
    use 'rktjmp/lush.nvim'
    use { 'metalelf0/jellybeans-nvim' }
    use {
        "mcchrish/zenbones.nvim",
        -- Optionally install Lush. Allows for more configuration or extending the colorscheme
        -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
        -- In Vim, compat mode is turned on as Lush only works in Neovim.
        requires = "rktjmp/lush.nvim"
    }
    -- use({
    --     'rose-pine/neovim',
    --     as = 'rose-pine',
    --     config = function()
    --         vim.cmd('colorscheme github-nvim-theme')
    --     end
    -- })
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = true,
                -- your confation comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    })
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end, }
    use("nvim-treesitter/playground")
    use("theprimeagen/harpoon")
    use("theprimeagen/refactoring.nvim")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    --use("nvim-treesitter/nvim-treesitter-context");

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use("folke/zen-mode.nvim")
    use("github/copilot.vim")
    use("eandrju/cellular-automaton.nvim")
    use("laytan/cloak.nvim")


    --line thing
    use "lukas-reineke/indent-blankline.nvim"
end)

