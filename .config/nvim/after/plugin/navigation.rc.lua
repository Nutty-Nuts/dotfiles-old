local telescope = require("telescope")
local tree = require("nvim-tree")
local bufferline = require("bufferline")
local dashboard = require("dashboard")
local noice = require("noice")

tree.setup({
	view = { side = "left" },
	renderer = {
		indent_markers = {
			enable = true,
		},
	},
})

vim.g.tagbar_position = "topleft vertical"
vim.g.tagbar_iconchars = { "", "" }

telescope.setup({
	defaults = {
		path_display = { "smart" },
	},
	pickers = {
		find_files = {
			theme = "dropdown",
			selection_caret = "󰐊 ",
			prompt_prefix = "   ",
		},
	},
	extensions = {
		file_browser = {
			theme = "dropdown",
			selection_caret = "󰐊 ",
			prompt_prefix = "   ",
			hijack_netrw = true,
		},
	},
})
telescope.load_extension("file_browser")

bufferline.setup({
	options = {
		show_buffer_close_icons = false,
		show_close_icon = true,
		color_icons = true,
		middle_mouse_command = "bdelete! %d",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				separator = false,
			},
		},
	},
})

dashboard.setup({
	theme = "doom",
	event = "VimEnter",
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	config = {
		header = {
			"                                 ",
			"                                 ",
			"                                 ",
			"                                 ",
			"                                 ",
			"                                 ",
			"                                 ",
			"           ▄ ▄                   ",
			"       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
			"       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
			"    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
			"  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
			"  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
			"▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
			"█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
			"    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
			"                                 ",
			"                                 ",
		},
		center = {
			{
				icon = " ",
				desc = "New File            ",
				action = "DashboardNewFile",
				key = "SPC-O",
				shortcut = "SPC o",
			},
			{
				icon = " ",
				desc = "Browse Files        ",
				action = "Telescope file_browser",
				key = "SPC-N",
				shortcut = "SPC n",
			},
			{
				icon = " ",
				desc = "Find File           ",
				action = "Telescope find_files",
				key = "SPC-F",
				shortcut = "SPC f",
			},
			{
				icon = " ",
				desc = "Configure Neovim    ",
				action = "edit ~/.config/nvim/lua/init.lua",
				key = "SPC-V",
				shortcut = "SPC v",
			},
			{
				icon = " ",
				desc = "Exit Neovim              ",
				action = "quit",
			},
		},
	},
})
