return {
  "folke/trouble.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local trouble = require("trouble")
    vim.keymap.set("n", "<leader>fq", function() trouble.open("quickfix") end, {desc="Trouble Quickfix", silent=true, noremap=true})
    vim.keymap.set("n", "<leader>fd", function() trouble.open("document_diagnostics") end, {desc="Trouble Document", silent=true, noremap=true})
    vim.keymap.set("n", "<leader>fw", function() trouble.open("workspace_diagnostics") end, {desc="Trouble Workspace", silent=true, noremap=true})
    trouble.setup()
  end,
}
