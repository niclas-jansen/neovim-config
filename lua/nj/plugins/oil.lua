return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup()
		vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
	dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
}
