return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				svelte = { "prettierd" },
				css = { "prettierd" },

				html = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				markdown = { "prettierd" },
				graphql = { "prettierd" },

				lua = { "stylua" },
				python = { "isort", "black" },
			},
			-- format_on_save = {
			--   lsp_fallback = true,
			--   async = false,
			--   timout_ms = 500
			-- }
		})

		vim.keymap.set("n", "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 2500,
			})
		end, { desc = "Format File" })

		vim.keymap.set("v", "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 2500,
			})
		end, { desc = "Format Range" })
	end,
}
