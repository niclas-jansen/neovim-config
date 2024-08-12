return {
  "folke/todo-comments.nvim",
  enabled = false,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    local todo_comments = require("todo-comments")

    local keymap = vim.keymap

    keymap.set("n", "]t", todo_comments.jump_next, { desc = "Next todo comment" })
    keymap.set("n", "]t", todo_comments.jump_prev, { desc = "Prev todo comment" })

    -- TODO: fix telescope only getting "TODO" and not other keywords
    keymap.set("n", "<leader>pc", ":TodoTelescope<CR>", { desc = "Telescope: Todo", silent = true })


    todo_comments.setup()
  end,
}
