local catppuccin = require("catppuccin")
local rosepine = require("rose-pine")
local devicons = require("nvim-web-devicons")

catppuccin.setup({
	show_end_of_buffer = false,
	transparent_background = false, -- disables setting the background color.
	term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
})

rosepine.setup({
	variant = "main",
})

devicons.setup({
	default = true,
	strict = true,
})

vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.fillchars = [[eob:~,fold: ,foldopen:,foldclose:]]

function setColorScheme(color, bg)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)

	if not bg then
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
	end
end

setColorScheme("catppuccin", false)
