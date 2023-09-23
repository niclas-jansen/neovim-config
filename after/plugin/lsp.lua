local lsp = require('lsp-zero')
require("luasnip.loaders.from_vscode").lazy_load()

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'eslint',
    --'sumneko_lua',
    'lua_ls',
    'rust_analyzer',
    --'emmet-language-server'
})

-- disabled for testing
-- disabled for testinglsp.on_attach(function(client, bufnr)
-- disabled for testing  lsp.default_keymaps({buffer = bufnr})
-- disabled for testingend)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action();

print(vim.lsp.get_log_path())
-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
-- local cmp_mappings = lsp.defaults.cmp_mappings({
--   ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--   ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--   ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--   ['<C-CR>'] = cmp.mapping.confirm({ select = true }),
--   ["<C-Space>"] = cmp.mapping.complete(),
-- })

cmp.setup({
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'buffer', keyword_length = 3},
        {name = 'luasnip', keyword_length = 2}
    },
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({select = false}),
    }
})
-- require'lspconfig'.emmet_language_server.setup{}
