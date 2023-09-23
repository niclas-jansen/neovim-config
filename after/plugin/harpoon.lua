local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, {desc= "add harpoon mark"})
vim.keymap.set("n", "<leader>f", ui.toggle_quick_menu, {desc= 'open harpoon'})

local keymap = "qwerty"

if (keymap == "qwerty") then
    vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end)
    vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end)
    vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end)
    vim.keymap.set("n", "<C-o>", function() ui.nav_file(4) end)
end

if (keymap == "colemak") then
    vim.keymap.set("n", "<C-n>", function() ui.nav_file(1) end)
    vim.keymap.set("n", "<C-e>", function() ui.nav_file(2) end)
    vim.keymap.set("n", "<C-i>", function() ui.nav_file(3) end)
    vim.keymap.set("n", "<C-o>", function() ui.nav_file(4) end)
end
