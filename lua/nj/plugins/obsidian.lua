return {
  "epwalsh/obsidian.nvim",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  opts = {
    workspaces = {
      {
        name="personal",
        path="D:\\projects\\obsidian-vault", 
      },
    },
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      -- Smart action depending on context, either follow link or toggle checkbox.
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
      -- ["<leader>po"] = {
      --   action = function()
      --     return require("obsidian").search()
      --     -- return require("obsidian").Client.find_notes()
      --
      --   end,
      --   -- opts = { buffer = true},
      -- },
      vim.keymap.set("n", "<leader>po", ":ObsidianSearch<CR>")
    },
  },
}
