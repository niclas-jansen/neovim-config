local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

local plugins = {

	-- modular lists fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.1",
		-- or                            , branch = '0.1.x',
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},

	-- colorscheme
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			vim.cmd("colorscheme catppuccin")
		end,
	},

	{ "nvim-treesitter/nvim-treesitter" },
	-- 'nvim-treesitter/playground')

	-- file marking % jumping tool
	{ "theprimeagen/harpoon" },

	-- change/add/delete surrounding characters
	{
		"kylechui/nvim-surround",
		version = "*",
		config = function()
			require("nvim-surround").setup({})
			-- require("nvim-surround").init({})
		end,
	},

	{ "mbbill/undotree" },

	-- git plugin
	{ "tpope/vim-fugitive" },
	{ "nvim-treesitter/nvim-treesitter-context" },

	-- Debug Adapter
	-- "mfussenegger/nvim-dap",
	-- "rcarriga/nvim-dap-ui",
	-- "jay-babu/mason-nvim-dap.nvim",

	-- LSP
	-- {
	-- 	"williamboman/mason.nvim",
	-- 	build = ":MasonUpdate",
	-- 	dependencies = {
	-- 		{ "williamboman/mason-lspconfig.nvim" }, -- Optional
	-- 	},
	-- },
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		{
			"williamboman/mason.nvim",
			build = ":MasonUpdate",
			dependencies = {
				{ "williamboman/mason-lspconfig.nvim", dependencies = { "neovim/nvim-lspconfig" } }, -- Optional

				{ "hrsh7th/nvim-cmp" }, -- Required
				{ "hrsh7th/cmp-nvim-lsp" }, -- Required
				{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" }, -- Required
				{ "hrsh7th/cmp-path" },
				{ "saadparwaiz1/cmp_luasnip" },
				{ "rafamadriz/friendly-snippets" },
			},
		},
		-- dependencies = {
		-- 	-- LSP Support
		-- 	-- {"neovim/nvim-lspconfig"} , -- Required
		-- 	-- LSP manager
		-- 	-- {
		-- 	-- 	"williamboman/mason.nvim",
		-- 	-- 	-- build: ':MasonUpdate',
		-- 	-- 	build = ":MasonUpdate",
		-- 	-- 	-- config = function()
		-- 	-- 	--   require("mason").setup()
		-- 	-- 	-- end
		-- 	-- 	-- build = function()
		-- 	-- 	--   pcall(vim.cmd, "MasonUpdate")
		-- 	-- 	-- end,
		-- 	-- 	dependencies = { "williamboman/mason-lspconfig.nvim" }, -- Optional
		-- 	-- },
		-- 	-- { "williamboman/mason-lspconfig.nvim" }, -- Optional
		--
		-- 	-- Autocompletion
		-- 	{ "hrsh7th/nvim-cmp" }, -- Required
		-- 	{ "hrsh7th/cmp-nvim-lsp" }, -- Required
		-- 	{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" }, -- Required
		-- 	{ "hrsh7th/cmp-path" },
		-- 	{ "saadparwaiz1/cmp_luasnip" },
		-- 	{ "rafamadriz/friendly-snippets" },
		--
		-- 	-- { 'mhartington/formatter.nvim' }, -- formatting
		-- 	-- {'mfussenegger/nvim-lint'}, --linting
		-- },
	},
	"jose-elias-alvarez/null-ls.nvim",

	-- use {"akinsho/toggleterm.nvim", version = '*', config = function()
	--     require("toggleterm").setup()
	-- end}

	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300

			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},

	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup()
		end,
	},

	-- automatic braces and quotation marks closing
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	-- commenting plugin
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- Indent Guide
	-- use { "shellRaining/hlchunk.nvim" }

	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			local ibl = require("ibl")
			ibl.setup({
				scope = {
					enabled = true,
					highlight = { "Function", "Label" },
				},
			})
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		config = function()
			local outline = require("symbols-outline")
			outline.setup()
			vim.keymap.set("n", "<leader>o", function() outline.open_outline() end, { desc = "Open Outline" })
			vim.keymap.set("n", "<leader>O", function() outline.close_outline() end, { desc = "Close Outline" })
		end,
	},
  {"iamcco/markdown-preview.nvim"},
}

require("lazy").setup(plugins, {})

-- vim.cmd("colorscheme rose-pine")
