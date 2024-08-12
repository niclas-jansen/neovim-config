return {
  "nvim-telescope/telescope.nvim",
  -- version = "0.1.1",
  -- or                            , branch = '0.1.x',
  dependencies = { 
    "nvim-lua/plenary.nvim" ,
    { 
      "nvim-telescope/telescope-file-browser.nvim",
      dependencies = { 
        "nvim-telescope/telescope.nvim", 
        "nvim-lua/plenary.nvim" 
      },
    }
  },
  config = function()
    local telescope = require("telescope")

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {desc= "find files"})
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") });
    end, {desc= "Grep search"})
    vim.keymap.set("n", "<leader>pb", ":Telescope file_browser<CR>", {desc="file browser"})
    vim.keymap.set("n", "<leader>pp", builtin.lsp_document_symbols, {desc="document symbols"})

    vim.keymap.set("n", "<Leader><tab>", builtin.commands, {desc = "Options List", noremap=false})
    telescope.setup{
      extensions = {
        file_browser = {
          hijack_netrw = true,
        },
      },
    }

    require("telescope").load_extension "file_browser"
  end
}



