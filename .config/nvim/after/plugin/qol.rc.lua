local autopairs = require("nvim-autopairs")
local colorizer = require("colorizer")
local tabout = require("tabout")
local indent = require("indent_blankline")
local todo = require("todo-comments")
local trouble = require("trouble")
local ufo = require("ufo")
local whichkey = require("which-key")
local gitsigns = require("gitsigns")
local git = require("git")
local leap = require("leap")

todo.setup()
tabout.setup()
whichkey.setup()
git.setup()
gitsigns.setup()

colorizer.setup({ "*" })
autopairs.setup({ disable_filetype = { "TelesopePrompt", "vim" } })

leap.add_default_mappings()

indent.setup({
	show_current_context = true,
	show_current_context_start = true,
	show_end_of_line = true,
})
vim.g.indent_blankline_filetype_exclude = {
	"dashboard",
	"text",
	"help",
}

trouble.setup({
	use_diagnostic_signs = true,
})

ufo.setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { "treesitter", "indent" }
	end,
})
