vim.opt.nu = true -- line numbers
vim.opt.relativenumber = true -- relative line numbers

-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
-- vim.opt.shiftwidth = 4
-- vim.opt.expandtab = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

-- get path for either linux or windows
if os.getenv("HOME") then
	vim.opt.undodir = os.getenv("HOME") .. "/.config/.nvim/undodir"
elseif os.getenv("UserProfile") then
	vim.opt.undodir = os.getenv("UserProfile") .. "/.config/.nvim/undodir"
end

vim.opt.undofile = true

vim.opt.hlsearch = true -- highlight all search results
vim.opt.incsearch = true
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" }) -- set left side gutter background transparent

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"
