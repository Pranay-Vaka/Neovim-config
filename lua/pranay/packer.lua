--This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'mhartington/formatter.nvim'
    use 'lervag/vimtex'
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
    use 'mfussenegger/nvim-jdtls'
    use "ellisonleao/gruvbox.nvim"
    use 'aktersnurra/no-clown-fiesta.nvim'
    use "kvrohit/rasmus.nvim"
    use 'Mofiqul/vscode.nvim'
    use 'ramojus/mellifluous.nvim'
    use { 'metalelf0/jellybeans-nvim' }
    use "savq/melange-nvim"
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
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
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

    use {
        "github/copilot.vim",
    }
    use("laytan/cloak.nvim")
    --line thing
    use "lukas-reineke/indent-blankline.nvim"
end)

