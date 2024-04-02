return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      vim.cmd("colorscheme catppuccin")
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  }
}

-- return {
--   {
--     "bluz71/vim-nightfly-guicolors",
--     name = "nightfly",
--     config = function()
--       -- "rose-pine/neovim"
--       vim.cmd("colorscheme nightfly")
--       -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--       -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--     end,
--   }
-- }
