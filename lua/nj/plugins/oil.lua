return {
  "stevearc/oil.nvim",
  enabled = true,
  config = function()
    require("oil").setup({
      view_options = {
        show_hidden = true,
      }
    })
    vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end,
  dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
}
