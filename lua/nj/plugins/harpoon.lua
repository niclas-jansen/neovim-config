return {
  "theprimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {"nvim-lua/plenary.nvim"},
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    -- telescope integration for harpoon
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end

    vim.keymap.set("n", "<leader>H", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })
    -- ------------

    vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "Harpoon: add mark" })
    vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Harpoon: open list' })

    vim.keymap.set("n", "<c-j>", function() harpoon:list():select(1) end, {desc = "harpoon: Goto 1"})
    vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end, {desc = "Harpoon: Goto 2"})
    vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end, {desc = "Harpoon: Goto 3"})
    vim.keymap.set("n", "<C-;>", function() harpoon:list():select(4) end, {desc = "Harpoon: Goto 4"})
  end
}
