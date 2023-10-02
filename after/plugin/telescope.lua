local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {desc= "find files"})
-- vim.keymap.set('n', '<leader>fb', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, {desc= "Grep search"})
vim.keymap.set("n", "<leader>pb", ":Telescope file_browser<CR>", {desc="file browser"})
vim.keymap.set("n", "<leader>pp", builtin.lsp_document_symbols, {desc="document symbols"})

-- require('telescope').setup {}
require("telescope").load_extension "file_browser"


