local mason = require("mason")
local masonlsp = require("mason-lspconfig")
local masonnull = require("mason-null-ls")
local masondap = require("mason-nvim-dap")

mason.setup()
masonlsp.setup({
	ensure_installed = {
		"html",
		"lua_ls",
		"tsserver",
		"pyright",
		"rust_analyzer",
		"jdtls",
		"clangd",
		"emmet_ls",
		"cssls",
		"bashls",
		"marksman",
		"cmake",
	},
})
masonnull.setup({
	ensure_installed = {
		"stylua",
		"rustfmt",
		"autopep8",
		"prettierd",
		"google_java_format",
		"markdownlint",
		"clang-format",
		"cmakelang",
		"beautysh",
	},
})
masondap.setup({
	ensure_installed = {
		"codelldb",
		"chrome",
		"python",
		"firefox",
		"js",
		"javadbg",
		"bash",
		"python",
	},
})
