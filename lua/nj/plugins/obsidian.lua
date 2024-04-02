return {
  "epwalsh/obsidian.nvim",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
}
