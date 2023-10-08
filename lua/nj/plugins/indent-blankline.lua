return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {},
  config = function()
    local ibl = require("ibl")
    ibl.setup({
      scope = {
        enabled = true,
        highlight = { "Function", "Label" },
      },
    })
  end,
}
