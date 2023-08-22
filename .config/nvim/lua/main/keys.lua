vim.g.mapleader = " "

local wk = require("which-key")

local function map_keybinds(mode, list)
	for k, v in pairs(list) do
		vim.keymap.set(mode, k, v[1], { noremap = true })
	end
end

local normal_key = {
	--- NvimTree
	["<leader>n"] = { ":NvimTreeToggle<CR>", "Toggle Tree" },
	["<leader>e"] = { ":NvimTreeFocus<CR>", "Focus Tree" },

	--- Telescope
	["<leader>ff"] = { ":Telescope find_files<CR>", "Find Files" },
	["<leader>fb"] = { ":Telescope file_browser<CR>", "Browse Files" },
	["<leader>fg"] = { ":Telescope git_files<CR>", "Find Git Files" },

	--- Tagbar
	["<leader>tg"] = { ":TagbarToggle<CR>", "Toggle Tagbar" },

	--- Trouble
	["<leader>tt"] = { ":TroubleToggle<CR>", "Toggle Trouble" },

	--- Terimnal
	["<leader>y"] = { ":terminal<CR>", "Open Terminal" },

	--- Buffers
	["<leader>x"] = { ":bdelete!<CR>", "Close Tab" },
	["<Tab>"] = { ":BufferLineCycleNext<CR>", "Next Tab" },
	["<S-Tab>"] = { ":BufferLineCyclePrev<CR>", "Previous Tab" },

	--- Debugger
	["<leader>db"] = {
		":lua require('dap').toggle_breakpoint()<CR>",
		"Toggle Breakpoint",
	},
	["<leader>dc"] = {
		":lua require('dap').continue()<CR>",
		"Start Debugging",
	},
	["<leader>dd"] = {
		":lua require('dapui').toggle()<CR>",
		"Open Debug UI",
	},
	["<C-A-Right>"] = {
		":lua require('dap').step_over()<CR>",
		"Step Over",
	},
	["<C-A-Down>"] = {
		":lua require('dap').step_into()<CR>",
		"Step Into",
	},

	--- Uncomment/Comment
	["<leader>/"] = { ":Commentary<CR>", "(Un)Comment Line" },

	--- LspSaga
	["<leader>lh"] = { ":Lspsaga hover_doc<CR>", "Hover Docs" },
	["<leader>lg"] = { ":Lspsaga goto_definition<CR>", "Goto Definition" },
	["<leader>lr"] = { ":Lspsaga rename<CR>", "Rename" },
	["<leader>lf"] = { ":Lspsaga lsp_finder<CR>", "Lsp Finder" },
	["<leader>lt"] = { ":Lspsaga term_toggle<CR>", "Toggle Terminal" },
	["<leader>la"] = { ":Lspsaga code_action<CR>", "Code Actions" },
}

local terminal_key = {
	--- Return to Normal Mode
	["<Esc>"] = { "<C-\\><C-n>" },
}

local visual_key = {
	--- Uncomment/Comment
	["<leader>/"] = { ":Commentary<CR>", "(Un)comment Lines" },

	--- Page down and Center Cursor
	["<C-d>"] = { "<C-d>zz" },

	--- Move Blocks of Code Up/Down
	["K"] = { ":m '<-2<CR>gv=gv" },
	["J"] = { ":m '>+1<CR>gv=gv" },
}

--- apply custom key binds
map_keybinds("n", normal_key)
map_keybinds("t", terminal_key)
map_keybinds("v", visual_key)

wk.register(normal_key)
wk.register(visual_key)

wk.register({
	["<leader>f"] = { name = "+file" },
	["<leader>d"] = { name = "+debug" },
	["<leader>l"] = { name = "+lspsaga" },
})
