return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },

	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring", --[[ add support for typescript / jsx comments ]]
	},
	config = function()
		require("Comment").setup({
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})
	end,
}
