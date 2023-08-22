local treesitter = require("nvim-treesitter.configs")
--- import plugins
local treesitter_context = require("treesitter-context")
local null_ls = require("null-ls")

--- configuration variales
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local formatting = null_ls.builtins.formatting

--- configuration functions
local callback = function()
	vim.lsp.buf.format({ bufnr = bufnr })
end
local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = callback,
		})
	end
end

--- server and formatter tables
local treesitter_servers = {
	"javascript",
	"typescript",
	"tsx",
	"css",
	"html",
	"svelte",
	"vue",
	"c",
	"cpp",
	"cmake",
	"rust",
	"lua",
	"java",
	"python",
	"rasi",
	"yaml",
	"json",
	"bash",
	"markdown",
	"markdown_inline",
}
local formatters = {
	"stylua",
	"rustfmt",
	"autopep8",
	"prettierd",
	"google_java_format",
	"markdownlint",
	"beautysh",
	"clang_format",
	"cmake_format",
}

local function sources(formatters)
	local sources = {}
	for _, formatter in ipairs(formatters) do
		table.insert(sources, formatting[formatter])
	end
	return sources
end

null_ls.setup({
	sources = sources(formatters),
	on_attach = on_attach,
})

treesitter.setup({
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disale = {},
	},
	ensure_installed = treesitter_servers,
	sync_install = true,
	auto_install = true,
	autotag = {
		enable = true,
	},
	rainbow = {
		enable = true,
	},
})
treesitter_context.setup({})
