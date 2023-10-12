return {
  "theprimeagen/harpoon",
  config = function()
    local mark, ui
    if (pcall(require, "harpoon")) then
      mark = require("harpoon.mark")
      ui = require("harpoon.ui")
    else
      return
    end

    vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon: add mark" })
    vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, { desc = 'Harpoon: open list' })

    vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end, {desc = "Harpoon: Goto 1"})
    vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end, {desc = "Harpoon: Goto 2"})
    vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end, {desc = "Harpoon: Goto 3"})
    vim.keymap.set("n", "<C-o>", function() ui.nav_file(4) end, {desc = "Harpoon: Goto 4"})
  end
}
