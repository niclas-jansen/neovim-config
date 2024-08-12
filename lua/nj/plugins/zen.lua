return {
  "pocco81/true-zen.nvim",
  enabled = true,
  config = function() 
    local zen = require("true-zen")
    local keymap = vim.keymap

    keymap.set("n", "<leader>z", "", { desc = "+zen" })
    keymap.set("n", "<leader>zn", zen.ataraxis, {desc="Zen: Ataraxis"})
    keymap.set("v", "<leader>zn", function() 
      local first = vim.fn.line('v')
      local last = vim.fn.line('.')
      zen.narrow(first, last)
    end, {desc="Zen: narrow"})
    keymap.set("n", "<leader>zm", zen.minimalist, {desc="Zen: Minimalist"})
    keymap.set("n", "<leader>zf", zen.focus, {desc="Zen: Focus"})
  end,

}
