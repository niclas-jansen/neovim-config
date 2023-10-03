vim.g.mapleader = " "

vim.keymap.set("n", "<leader>f", '', { desc = "+filetest" })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "exit file" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move highlighted lines DOWN" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move highlighted lines UP" })

vim.keymap.set("x", "<leader>pp", [["_dP]], { desc = "paste without replacing buffer" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "yank to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "yank line to clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>v", [["+p]], { desc = "paste from clipboard" })

-- quick fix navigation
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>/", vim.cmd.nohlsearch)

vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format)
