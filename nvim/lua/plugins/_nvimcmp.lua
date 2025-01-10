return {
	{
		"nvim-cmp",
		lazy = true,
		opts = function(_, opts)
			local cmp = require("cmp")
			opts.window = {
				documentation = cmp.config.window.bordered(),
				completion = cmp.config.window.bordered({
					winhighlight = "Normal:TelescopeNormal,FloatBorder:TelescopeBorder,CursorLine:Visual,Search:None",
				}),
			}
			local kind_icons = {
				Text = "",
				Method = "m",
				Function = "",
				Constructor = "",
				Field = "",
				Variable = "",
				Class = "",
				Interface = "",
				Module = "",
				Property = "",
				Unit = "",
				Value = "",
				Enum = "",
				Keyword = "",
				Snippet = "",
				Color = "",
				File = "",
				Reference = "",
				Folder = "",
				EnumMember = "",
				Constant = "",
				Struct = "",
				Event = "",
				Operator = "",
				TypeParameter = "",
				Codeium = "",
			}
			opts.formatting = {
				fields = { "abbr", "menu", "kind" },
				format = function(entry, item)
					item.menu = ({
						nvim_lsp = "L",
						luasnip = "S",
						buffer = "B",
						path = "P",
						nvim_lua = "N",
						codeium = "A",
					})[entry.source.name]

					local max_content_width = 25
					local content = item.abbr
					if #content > max_content_width then
						item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. "..."
					else
						item.abbr = content .. (" "):rep(max_content_width - #content)
					end
					item.kind = string.format("%s %s", kind_icons[item.kind], item.kind)
					return item
				end,
			}
			table.insert(opts.sources, 1, {
				name = "codeium",
				group_index = 1,
				priority = 100,
			})
		end,
		keys = {
			"i",
			{
				"<C-j>",
				function()
					return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<C-j>"
				end,
				expr = true,
				silent = true,
				mode = { "i", "s" },
			},
			{
				"<C-j>",
				function()
					local cmp = require("cmp")
					if cmp.visible() then
						return cmp.select_next_item()
					else
						return "<C-z>"
					end
				end,
				expr = true,
				silent = true,
				mode = "c",
			},
			{
				"<C-k>",
				function(fallback)
					local cmp = require("cmp")
					if cmp.visible() then
						cmp.select_prev_item()
					else
						fallback()
					end
				end,
				expr = true,
				silent = true,
				mode = "c",
			},
			{
				"<C-e>",
				function(fallback)
					local ls = require("luasnip")
					if ls.choice_active() then
						ls.change_choice(1)
						-- else
						-- 	fallback()
					end
				end,
				expr = true,
				silent = true,
				mode = { "i", "s" },
			},
		},
	},
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		keys = {
			{ "i" },
		},
	},
	{
		"vuetifyjs/vuetify-vscode",
		ft = "vue",
		config = function()
			local lazypath = vim.fn.stdpath("data") .. "/lazy/vuetify-vscode"
			require("luasnip.loaders.from_vscode").lazy_load({ paths = { lazypath } })
		end,
	},
}
