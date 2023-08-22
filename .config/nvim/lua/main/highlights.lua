vim.opt.cursorline = true

--- floating menu configurations
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 5
vim.opt.pumheight = 10

vim.opt.background = "dark"

local mocha = require("catppuccin.palettes").get_palette("mocha")
local catppuccin = mocha

local function set_highlights(list)
	for k, v in pairs(list) do
		vim.api.nvim_set_hl(0, k, { fg = v[1], bg = v[2] })
	end
end

local function set_icons(list)
	for k, v in pairs(list) do
		vim.fn.sign_define(k, { text = v[1], texthl = v[2], linehl = v[2], numhl = v[2] })
	end
end

--- custom higlight groups
local highlights = {
	["CmpItemMenu"] = { catppuccin.rosewater, "none" },
	["MsgArea"] = { catppuccin.rosewater, "none" },
	["DapStopped"] = { catppuccin.green, "none" },
	["DapBreakpoint"] = { catppuccin.red, "none" },
	["DapLogPoint"] = { catppuccin.blue, "none" },
	["TagbarAccessPublic"] = { catppuccin.green, "none" },
	["TagbarVisibilityPublic"] = { catppuccin.green, "none" },
	["TagbarAccessPrivate"] = { catppuccin.red, "none" },
	["TagbarVisibilityPrivate"] = { catppuccin.red, "none" },
	["TagbarAccessProtected"] = { catppuccin.blue, "none" },
	["TagbarVisibilityProtected"] = { catppuccin.blue, "none" },
}

--- custom icons and colors
local icons = {
	["DapBreakpoint"] = { "", "DapBreakpoint" },
	["DapLogPoint"] = { "", "DapLogPoint" },
	["DapStopped"] = { "󰐊", "DapStopped" },
}

set_highlights(highlights)
set_icons(icons)
