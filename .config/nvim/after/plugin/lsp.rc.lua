--- import plugins
local lsp = require("lspconfig")
local lspsaga = require("lspsaga")

--- declare configuration variables
local protocol = require("vim.lsp.protocol")
local capabilities = require("cmp_nvim_lsp").default_capabilities(protocol.make_client_capabilities())
capabilities.offsetEncoding = { "utf-16" }

--- declare configuration lists
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
local servers = {
	"pyright",
	"rust_analyzer",
	"clangd",
	"tsserver",
	"html",
	"emmet_ls",
	"cssls",
	"lua_ls",
	"cmake",
	"bashls",
}

--- declare custom configurations for specific lanugage servers
local emmet_configs = { "html", "typescriptreact", "javascriptreact" }
local bash_configs = { "sh", "xinitrc" }
local lua_configs = {
	Lua = {
		runtime = { version = "LuaJIT" },
		diagnostics = { globals = { "vim" } },
		settings = { telemetry = { enable = false } },
		workspace = {
			library = vim.api.nvim_get_runtime_file("", true),
			checkThirdParty = false,
		},
	},
}

--- iterate and apply configurations across lists
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

for _, server in ipairs(servers) do
	local configs = { capabilities = capabilities }

	if server == "emmet_ls" then
		configs.filetypes = emmet_configs
	elseif server == "lua_ls" then
		configs.settings = lua_configs
	elseif server == "bashls" then
		configs.filetypes = bash_configs
	end

	lsp[server].setup(configs)
end

lspsaga.setup({})
