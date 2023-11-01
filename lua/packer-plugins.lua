return require("packer").startup(function(use)
    vim.cmd [[packadd packer.nvim]]
    --packer can manage itself
    use "wbthomason/packer.nvim"

    use "cohama/lexima.vim"
    --coloursceme
    use { "ellisonleao/gruvbox.nvim" }
    use "savq/melange-nvim"
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/nvim-compe"
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        "psliwka/vim-smoothie"
    }

    use 'karb94/neoscroll.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate"
    }

    use {
        'declancm/cinnamon.nvim',
        config = function() require('cinnamon').setup() end
    }
    use "BurntSushi/ripgrep"
    use 'sunjon/shade.nvim'
    use 'NvChad/nvim-colorizer.lua'
    use "nvim-tree/nvim-web-devicons"
    use {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('Dashboard').setup {
                theme = 'hyper'
            }
        end,
        requires = { 'nvim-tree/nvim-web-devicons' }
    }
    use({
        "cappyzawa/trim.nvim",
        config = function()
            require("trim").setup({})
        end
    })
end)
