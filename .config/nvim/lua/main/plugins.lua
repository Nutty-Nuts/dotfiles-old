local lazy = require("lazy")

local function compile(list)
	local plugins = {}
	for _, n in ipairs(list) do
		for _, m in ipairs(n) do
			table.insert(plugins, m)
		end
	end
	return plugins
end

local user_interface = {
	{
		"nvim-tree/nvim-web-devicons",
		lazy = false,
		priority = 1000,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000, -- Ensure it loads first
	},
	"shaunsingh/nord.nvim",
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},
	"morhetz/gruvbox",
}

local file_navigation = {
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	"nvim-telescope/telescope-symbols.nvim",
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
}

local syntax = {
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	},
	"nvim-treesitter/nvim-treesitter-context",
	"HiPhish/nvim-ts-rainbow2",

	"neovim/nvim-lspconfig",
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter",
		},
	},
	"jose-elias-alvarez/null-ls.nvim",
	"mfussenegger/nvim-jdtls",
}

local debuging = {
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
}

local package_management = {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	"jay-babu/mason-nvim-dap.nvim",
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
	},
}

local code_completion = {
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"L3MON4D3/LuaSnip",
	"onsails/lspkind-nvim",
	"rafamadriz/friendly-snippets",
	"saadparwaiz1/cmp_luasnip",
}

local quality_of_life = {
	"windwp/nvim-autopairs",
	"lukas-reineke/indent-blankline.nvim",
	"abecodes/tabout.nvim",
	"norcalli/nvim-colorizer.lua",
	"folke/todo-comments.nvim",
	"folke/trouble.nvim",
	"preservim/tagbar",
	"tpope/vim-commentary",
	"glepnir/dashboard-nvim",
	"dinhhuy258/git.nvim",
	"lewis6991/gitsigns.nvim",
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
}

local code_navigation = {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
	},
	"ggandor/leap.nvim",
	"tpope/vim-repeat",
	"ThePrimeagen/harpoon",
}

local opts = {}

lazy.setup(
	compile({
		user_interface,
		file_navigation,
		syntax,
		debuging,
		package_management,
		quality_of_life,
		code_completion,
		code_navigation,
	}),
	opts
)
