return {
  
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
  dependencies = 
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {
      { "williamboman/mason-lspconfig.nvim", dependencies = { "neovim/nvim-lspconfig" } }, -- Optional

      { "hrsh7th/nvim-cmp" }, -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "L3MON4D3/LuaSnip", build = "make install_jsregexp" }, -- Required
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "rafamadriz/friendly-snippets" },
    },
  },
  config = function()
    local lsp_zero = require("lsp-zero")
    local mason = require("mason")
    -- require("luasnip.loaders.from_vscode").lazy_load()
    lsp_zero.preset("recommended")

    mason.setup({})
    require("mason-lspconfig").setup({
      ensure_installed = {
        "tsserver",
        "eslint",
        "lua_ls",
        "rust_analyzer",
        --'emmet-language-server'
      },
      handlers = {
        lsp_zero.default_setup,
      },
    })

    -- lsp.ensure_installed({
    --     'tsserver',
    --     'eslint',
    --     --'sumneko_lua',
    --     'lua_ls',
    --     'rust_analyzer',
    --     --'emmet-language-server'
    -- })

    -- disabled for testing
    -- disabled for testinglsp.on_attach(function(client, bufnr)
    -- disabled for testing  lsp.default_keymaps({buffer = bufnr})
    -- disabled for testingend)

    -- (Optional) Configure lua language server for neovim
    -- require('lspconfig').lua_ls.setup(lsp_zero.nvim_lua_ls())

    lsp_zero.setup()

    local cmp = require("cmp")
    local cmp_action = require("lsp-zero").cmp_action()

    -- print(vim.lsp.get_log_path())
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    -- local cmp_mappings = lsp.defaults.cmp_mappings({
    --   ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    --   ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    --   ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    --   ['<C-CR>'] = cmp.mapping.confirm({ select = true }),
    --   ["<C-Space>"] = cmp.mapping.complete(),
    -- })

    cmp.setup({
      sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "buffer", keyword_length = 3 },
        { name = "luasnip", keyword_length = 2 },
      },
      mapping = {
        ["<C-Space>"] = cmp.mapping.complete(),
        -- ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
        -- ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-l>"] = cmp.mapping.confirm({ select = false }),
      },
    })
    -- require'lspconfig'.emmet_language_server.setup{}
  end,
}
