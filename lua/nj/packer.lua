-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }

    -- colorscheme
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use { "catppuccin/nvim", as = "catppuccin" }

    vim.cmd('colorscheme rose-pine')

    use('nvim-treesitter/nvim-treesitter')
    use('nvim-treesitter/playground')

    use('theprimeagen/harpoon')

    use({'kylechui/nvim-surround', tag = '*',
        config = function()
            require("nvim-surround").setup({})
        end
    })

    use('mbbill/undotree')

    use('tpope/vim-fugitive')
    use ('mfussenegger/nvim-dap')
    use ('rcarriga/nvim-dap-ui')
    use ("jay-babu/mason-nvim-dap.nvim")
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim',
            run = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'rafamadriz/friendly-snippets'},
    }
}

use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
end}

use {
    "folke/which-key.nvim",
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    end
}
use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}
use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}
use { "shellRaining/hlchunk.nvim" }
use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}
end)

