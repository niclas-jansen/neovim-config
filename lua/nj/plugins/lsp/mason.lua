return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	build = ":MasonUpdate",
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				-- icons = {
				--   package_installed = ""
				-- }
			},
      PATH = "prepend", -- "skip" seems to cause the spawning error
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",

				"ts_ls",
				"eslint",

				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"graphql",
				-- "emmet_ls",
				"prismals",
        "emmet_language_server",

				"rust_analyzer",

        "nil_ls",
			},
			-- automatically install configures servers
			automatic_installation = true, -- note the same as ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettierd",
				"prettier",
				"stylua",
				-- "isort",
				-- "black",
				-- "pylint",
				"eslint_d",
			},
		})
	end,
}
