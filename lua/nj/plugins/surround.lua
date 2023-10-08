return {
  "kylechui/nvim-surround",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("nvim-surround").setup({})
    -- require("nvim-surround").init({})
  end,
}
