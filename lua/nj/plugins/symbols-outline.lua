return {
  "simrat39/symbols-outline.nvim",
  config = function()
    local outline = require("symbols-outline")
    outline.setup()
    vim.keymap.set("n", "<leader>o", function() outline.open_outline() end, { desc = "Open Outline" })
    vim.keymap.set("n", "<leader>O", function() outline.close_outline() end, { desc = "Close Outline" })
  end,
}
