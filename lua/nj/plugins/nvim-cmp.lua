return {

	"hrsh7th/nvim-cmp", -- Required
	event = "InsertEnter",
	dependencies = {
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" }, -- Required
		{ "saadparwaiz1/cmp_luasnip" },
		{ "rafamadriz/friendly-snippets" },
		{ "luckasRanarison/tailwind-tools.nvim" },
		{ "onsails/lspkind-nvim" },
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local s = luasnip.snippet
		local t = luasnip.text_node
		local i = luasnip.insert_node
		-- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "../../../snippets" } })
		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_vscode").lazy_load({ paths = "./../../../snippets" })

		luasnip.add_snippets("typescriptreact", {
			s("hello", {
				t('print("hello world)'),
			}),
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			formatting = {
				-- fields = { "kind", "abbr", "menu" },
				-- format = function(entry, vim_item)
				--   vim_item.kind_symbol = (lspkind.symbolic or lspkind.get_symbol) vim\_item.kind),
				--   vim_item.kind = " " .. vim_item.kind_symbol,
				--   vim_item.abbr = funcs.truncate(vim_item.abbr, Config.cmp.max_abbr_item_width),
				-- end
        --
        format = require("lspkind").cmp_format({
          before = require("tailwind-tools.cmp").lspkind_format
        }),
				-- format = require("lspkind").cmp_format({
				--   before = require("tailwind-tools.cmp").lspkind_format
				-- },
			},
			mapping = cmp.mapping.preset.insert({
				-- ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
				-- ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-Space>"] = cmp.mapping.complete(), -- open completions, might not work in windows terminal due to how c-space input is handled
				["<C-h>"] = cmp.mapping.complete(),
				["<return>"] = cmp.mapping.confirm({ select = false }), -- only confirm explicitly selected completion
				-- ["<C-Space>"] = cmp.mapping.confirm({ select = true }),
				-- ["<C-l>"] = cmp.mapping.confirm({ select = false }), -- only confirm explicitly selected completion
				["<C-l>"] = cmp.mapping.confirm({ select = true }), -- confirm explicitly selected completion or first in list
			}),

			-- soucrs for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- lsp autocompletion
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
				{
					name = "spell",
					option = {
						keep_all_entries = false,
						enable_in_context = function()
							return true
						end,
					},
				},
			}),
		})

		-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
		-- local opts = { noremap = true, silent = true }
		--
		-- opts.desc = "Autocomplete: Start"
		-- vim.keymap.set("i", "<C-Space>", cmp.mapping.complete(), opts);
		--
		-- opts.desc = "Autocomplete: Next"
		-- vim.keymap.set("i", "<C-j>", cmp.mapping.select_next_item(cmp_select), opts);
		--
		-- opts.desc = "Autocomplete: Previous"
		-- vim.keymap.set("i", "<C-k>", cmp.mapping.select_prev_item(cmp_select), opts);
		--
		-- opts.desc = "Autocomplete: Confirm"
		-- vim.keymap.set("i", "<C-l>", cmp.mapping.confirm({ select = false }), opts);
	end,
}
