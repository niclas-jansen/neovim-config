return {

  "hrsh7th/nvim-cmp",     -- Required
  event = "InsertEnter",
  dependencies = {
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "L3MON4D3/LuaSnip",            build = "make install_jsregexp" },           -- Required
    { "saadparwaiz1/cmp_luasnip" },
    { "rafamadriz/friendly-snippets" },
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load()

    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        -- ["<C-Space>"] = cmp.mapping.complete(),
        -- ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
        -- ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<return>"] = cmp.mapping.confirm({ select = false }),
        ["<C-Space>"] = cmp.mapping.confirm({ select = true }),
        ["<C-l>"] = cmp.mapping.confirm({ select = false }),
      }),

      -- soucrs for autocompletion
      sources = cmp.config.sources({
        {name = "luasnip"}, -- snippets
        {name = "buffer"}, -- text within current buffer
        {name = "path"}, -- file system paths
        {name = "spell", option = {
          keep_all_entries = false,
          enable_in_context = function()
            return true
          end,
        }}
      })
    })

    -- local cmp_select = { behavior = cmp.SelectBehavior.Select }
    -- local opts = { noremap = true, silent = true }
    --
    -- opts.desc = "Autocomplete: Start"
    -- vim.keymap.set("i", "<C-Space>", cmp.mapping.complete(), opts);
    --
    -- opts.desc = "Autocomplete: Next"
    -- vim.keymap.set("i", "<C-j>", cmp.mapping.select_next_item(cmp_select), opts);
    --
    -- opts.desc = "Autocomplete: Previous"
    -- vim.keymap.set("i", "<C-k>", cmp.mapping.select_prev_item(cmp_select), opts);
    --
    -- opts.desc = "Autocomplete: Confirm"
    -- vim.keymap.set("i", "<C-l>", cmp.mapping.confirm({ select = false }), opts);


  end
}
