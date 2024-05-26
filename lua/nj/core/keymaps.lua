vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>f", "", { desc = "+filetest" })
keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "exit file" })

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move highlighted lines DOWN" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move highlighted lines UP" })

keymap.set("x", "<leader>pp", [["_dP]], { desc = "paste without replacing buffer" })

-- next greatest remap ever : asbjornHaland
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "yank to clipboard" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "yank line to clipboard" })

keymap.set({ "n", "v" }, "<leader>v", [["+p]], { desc = "paste from clipboard" })

-- quick fix navigation
-- keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- remap half page up/down to also center cursor
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

keymap.set("n", "<leader>/", vim.cmd.nohlsearch, { desc = "Search: Clear Highlighting" })

keymap.set("n", "<leader>ff", vim.lsp.buf.format, { desc = "Format: File" })

-- keymap.set("n", "<S-CMD>j", vim.api.nvim_win_set_height(0, "20"), { desc = "Format: File" })


keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split: window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split: window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Split: make equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Split: close current split" }) -- make split windows equal width & height

keymap.set("n", "<leader>ss", function()
	if vim.opt.spell:get() == true then
		vim.opt.spell = false
		print("spelling DISABLED")
	else
		vim.opt.spell = true
		print("spelling ENABLED")
	end
end, { desc = "toggle spelling" })
