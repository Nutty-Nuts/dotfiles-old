local lspkind = require("lspkind")
local luasnip = require("luasnip")
local cmp = require("cmp")

local format = function(entry, vim_item)
	local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 30 })(entry, vim_item)
	local strings = vim.split(kind.kind, "%s", { trimempty = true })
	kind.kind = " " .. (strings[1] or "") .. " "
	kind.menu = "    [" .. (strings[2] or "") .. "]"

	return kind
end

lspkind.init({
	mode = "symbol_text",
	preset = "codicons",
	symbol_map = {
		Text = "󰉿",
		Method = "󰆧",
		Function = "󰊕",
		Constructor = "",
		Field = "󰜢",
		Variable = "󰀫",
		Class = "󰠱",
		Interface = "",
		Module = "",
		Property = "󰜢",
		Unit = "󰑭",
		Value = "󰎠",
		Enum = "",
		Keyword = "󰌋",
		Snippet = "",
		Color = "󰏘",
		File = "󰈙",
		Reference = "󰈇",
		Folder = "󰉋",
		EnumMember = "",
		Constant = "󰏿",
		Struct = "󰙅",
		Event = "",
		Operator = "󰆕",
		TypeParameter = "",
	},
})
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
	-- completion item customization
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = format,
	},
	-- completion prompt customization
	window = {
		completion = cmp.config.window.bordered({
			winhighlight = "Normal:CmpNormal",
			scrollbar = false,
		}),
		documentation = cmp.config.window.bordered({
			winhighlight = "Normal:CmpNormal",
		}),
	},
})
