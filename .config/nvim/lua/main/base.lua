local encoding = "utf-8"
local tab = 4

vim.opt.clipboard = "unnamedplus"
vim.opt.backup = false

--- file encoding configuration
vim.scriptencoding = encoding
vim.opt.encoding = encoding
vim.opt.fileencoding = encoding

--- gutter configuration
vim.wo.number = true
vim.wo.relativenumber = true

vim.hlsearch = true

--- command line configuration
vim.opt.showcmd = true
vim.opt.cmdheight = 1

--- tab/spaces configuration
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.shiftwidth = tab
vim.opt.tabstop = tab

--- indent configuration
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.linebreak = true

--- mouse and information configuration
vim.opt.shm:append("aWT")
vim.opt.mouse:append("a")
vim.opt.mousemev = true

--- user interface configuration
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.splitright = true

-- vim.opt.cmdheight = 1

--- autocmds
vim.api.nvim_create_autocmd("TermOpen", {
	command = "setlocal nonumber norelativenumber",
})
