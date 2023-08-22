local lualine = require("lualine")

--- colorschemes
local flavor = {
	latte = require("catppuccin.palettes").get_palette("latte"),
	frappe = require("catppuccin.palettes").get_palette("frappe"),
	macchiato = require("catppuccin.palettes").get_palette("macchiato"),
	mocha = require("catppuccin.palettes").get_palette("mocha"),
}
local catppuccin = flavor.macchiato

--- lualine configuration
local config = {
	options = {
		icons_enabled = true,
		component_separators = "",
		disabled_filetypes = { "NvimTree", "tagbar", "dap-repl", "help" },
		section_separators = "",
		theme = {
			normal = { c = { fg = catppuccin.fg, bg = catppuccin.crust } },
			inactive = { c = { fg = catppuccin.fg, bg = catppuccin.bg } },
		},
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

--- mode color
local mode = {
	n = catppuccin.red,
	i = catppuccin.green,
	v = catppuccin.blue,
	[""] = catppuccin.blue,
	V = catppuccin.blue,
	c = catppuccin.lavender,
	no = catppuccin.red,
	s = catppuccin.peach,
	S = catppuccin.peach,
	[""] = catppuccin.peach,
	ic = catppuccin.yellow,
	R = catppuccin.mauve,
	Rv = catppuccin.mauve,
	cv = catppuccin.red,
	ce = catppuccin.red,
	r = catppuccin.sky,
	rm = catppuccin.sky,
	["r?"] = catppuccin.sky,
	["!"] = catppuccin.red,
	t = catppuccin.red,
}

local path = vim.loop.cwd() .. "/.git"
local ok, err = vim.loop.fs_stat(path)
local minwidth
local altwidth

if ok then
	minwidth = 82
	altwidth = 70
else
	minwidth = 60
	altwidth = 70
end

--- component conditions
local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	buffer_is_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 0
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > minwidth
	end,
	reveal_in_width = function()
		return vim.fn.winwidth(0) < minwidth
	end,
	buffer_not_empty_and_hide_in_width = function()
		return ((vim.fn.empty(vim.fn.expand("%:t")) ~= 1) and (vim.fn.winwidth(0) > altwidth))
	end,
}

--- inserts components on the left or right side
local insert_component = {
	left = function(component)
		table.insert(config.sections.lualine_c, component)
	end,
	right = function(component)
		table.insert(config.sections.lualine_x, component)
	end,
}

--- insert a table of components
local function insert_components(components, side)
	if side then
		for _, i in ipairs(components) do
			insert_component.left(i)
		end
	else
		for _, i in ipairs(components) do
			insert_component.right(i)
		end
	end
end

local component_icons = {
	vim_logo = function()
		return ""
	end,
	left_separator = function()
		return ""
	end,
	right_separator = function()
		return ""
	end,
	dir = function()
		return "󰉋"
	end,
	progress = function()
		return ""
	end,
}

local component_methods = {
	lsp = function()
		local msg = "No Active Lsp"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	dir = function()
		local dir = vim.fn.expand("%:p:h:t")
		local final
		if string.len(dir) > 6 then
			final = string.sub(dir, 1, 6) .. ".."
		else
			final = dir
		end
		return final
	end,
	filename = function()
		local dir = vim.fn.expand("%:p:t:r")
		local final
		if string.len(dir) > 6 then
			final = string.sub(dir, 1, 6) .. ".."
		else
			final = dir
		end
		return final
	end,
}

local comp_color = {
	bg = function()
		return { bg = mode[vim.fn.mode()], fg = catppuccin.crust }
	end,
	bg_bold = function()
		return { bg = mode[vim.fn.mode()], fg = catppuccin.crust, gui = "bold" }
	end,
	fg = function()
		return { bg = catppuccin.surface2, fg = mode[vim.fn.mode()] }
	end,
	fg_empty = function()
		return { fg = mode[vim.fn.mode()] }
	end,
	static = function(colorfg, colorbg)
		return { bg = colorbg, fg = colorfg }
	end,
	static_bold = function(colorbg, colorfg)
		return { bg = colorbg, fg = colorfg, gui = "bold" }
	end,
}

local left_components = {
	{
		component_icons.vim_logo,
		color = comp_color.bg,
		padding = { right = 1, left = 1 },
	},
	{
		"mode",
		color = comp_color.bg_bold,
		cond = conditions.hide_in_width,
		padding = { right = 1, left = 0 },
	},
	{
		component_icons.left_separator,
		color = comp_color.fg,
		cond = conditions.buffer_not_empty,
		padding = { left = 0, right = 0 },
	},
	{
		component_icons.left_separator,
		color = comp_color.fg_empty,
		cond = conditions.buffer_is_empty,
		padding = { left = 0, right = 0 },
	},
	{
		component_icons.left_separator,
		color = comp_color.static(catppuccin.surface2, catppuccin.surface0),
		cond = conditions.buffer_not_empty,
		padding = { left = 0, right = 0 },
	},
	{
		"filetype",
		color = comp_color.static_bold(catppuccin.surface0, catppuccin.magenta),
		cond = conditions.buffer_not_empty,
		padding = { right = 1, left = 1 },
		icon_only = true,
		icon = { align = "left" },
	},
	{
		component_methods.filename,
		color = comp_color.static_bold(catppuccin.surface0, catppuccin.magenta),
		cond = conditions.buffer_not_empty_and_hide_in_width,
	},
	{
		component_icons.left_separator,
		color = comp_color.static(catppuccin.surface0, catppuccin.crust),
		cond = conditions.buffer_not_empty,
		padding = { left = 0, right = 0 },
	},
	{
		"branch",
	},
	{
		"diff",
		padding = { left = 0, right = 0 },
		symbols = { added = " ", modified = " ", removed = " " },
	},
}

local right_components = {
	{
		"diagnostics",
		padding = { left = 0, right = 1 },
		sources = { "nvim_diagnostic" },
		symbols = { error = " ", info = " ", warn = " " },
	},
	{
		component_methods.lsp,
		color = { fg = catppuccin.subtext0, gui = "bold" },
		padding = { left = 1, right = 1 },
		icon = " ",
	},
	{
		component_icons.right_separator,
		color = { fg = catppuccin.red, gui = "bold" },
		cond = conditions.hide_in_width,
		padding = { left = 0, right = 0 },
	},
	{
		component_icons.dir,
		color = { fg = catppuccin.crust, bg = catppuccin.red, gui = "bold" },
		cond = conditions.hide_in_width,
		padding = { left = 0, right = 1 },
	},
	{
		component_methods.dir,
		color = { fg = catppuccin.red, bg = catppuccin.surface0, gui = "bold" },
		cond = conditions.hide_in_width,
	},
	{
		component_icons.right_separator,
		color = { fg = catppuccin.green, bg = catppuccin.surface0, gui = "bold" },
		cond = conditions.hide_in_width,
		padding = { left = 0, right = 0 },
	},
	{
		component_icons.progress,
		color = { fg = catppuccin.crust, bg = catppuccin.green, gui = "bold" },
		cond = conditions.hide_in_width,
		padding = { left = 0, right = 1 },
	},
	{
		"progress",
		color = { fg = catppuccin.green, bg = catppuccin.surface0, gui = "bold" },
		cond = conditions.hide_in_width,
	},
}

insert_components(left_components, true)
insert_components(right_components, false)

lualine.setup(config)
