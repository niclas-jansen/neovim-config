require('mason').setup()
require('mason-nvim-dap').setup({
    ensure_installed = {'node2'},
    handlers = {}
})
require("dapui").setup()
