return {
	{
		"which-key.nvim",
		event = "LazyFile",
		opts = {
			icons = {
				rules = false,
			},
			spec = {
				{ "<leader><tab>", hidden = true },
				{ "<leader>sn", hidden = true },
				{ "<leader>n", group = "+noice" },
				{ "<leader>S", group = "+session" },
			},
			win = {
				border = "rounded",
			},
		},
	},
	{
		"ibhagwan/fzf-lua",
		keys = {
			{ "<leader>/", mode = { "n", "v" }, false },
			{ "<leader>G", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
			{ "<leader><space>", LazyVim.pick("files"), desc = "which_key_ignore" },
			{ "<leader>:", "<cmd>FzfLua command_history<cr>", desc = "which_key_ignore" },
		},
	},
	{
		"szw/vim-maximizer",
		keys = {
			{ "<leader>wm", mode = { "n", "v" }, "<cmd>MaximizerToggle<cr>", desc = "Maximizer" },
			{ "<C-w>h", mode = { "n", "v" }, "<C-w>h<cmd>MaximizerToggle<cr>", desc = "Maximize left" },
			{ "<C-w>j", mode = { "n", "v" }, "<C-w>j<cmd>MaximizerToggle<cr>", desc = "Maximize down" },
			{ "<C-w>k", mode = { "n", "v" }, "<C-w>k<cmd>MaximizerToggle<cr>", desc = "Maximize up" },
			{ "<C-w>l", mode = { "n", "v" }, "<C-w>l<cmd>MaximizerToggle<cr>", desc = "Maximize right" },
			{ "<leader>wh", mode = { "n", "v" }, "<C-w>h<cmd>MaximizerToggle<cr>", desc = "Maximize left" },
			{ "<leader>wj", mode = { "n", "v" }, "<C-w>j<cmd>MaximizerToggle<cr>", desc = "Maximize down" },
			{ "<leader>wk", mode = { "n", "v" }, "<C-w>k<cmd>MaximizerToggle<cr>", desc = "Maximize up" },
			{ "<leader>wl", mode = { "n", "v" }, "<C-w>l<cmd>MaximizerToggle<cr>", desc = "Maximize right" },
		},
	},
	{
		"neo-tree.nvim",
		cmd = "Neotree",
		opts = {
			commands = {
				open_then_close = function(state, toggle_directory) -- define a global "hello world" function
					require("neo-tree.sources.common.commands").open(state, toggle_directory)
					vim.schedule(function()
						vim.cmd([[Neotree close]])
					end)
				end,
			},
			window = {
				mappings = {
					["oc"] = "none",
					["od"] = "none",
					["og"] = "none",
					["om"] = "none",
					["on"] = "none",
					["os"] = "none",
					["ot"] = "none",
					["<C-f>"] = "none",
					["<C-b>"] = "none",
					[","] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "," } },
					[",c"] = { "order_by_created", nowait = false },
					[",d"] = { "order_by_diagnostics", nowait = false },
					[",g"] = { "order_by_git_status", nowait = false },
					[",m"] = { "order_by_modified", nowait = false },
					[",n"] = { "order_by_name", nowait = false },
					[",s"] = { "order_by_size", nowait = false },
					[",t"] = { "order_by_type", nowait = false },
					["o"] = "open",
					["O"] = "open_then_close",
					["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
					["l"] = "open",
					["h"] = "close_node",
					["J"] = { "scroll_preview", config = { direction = -20 } },
					["K"] = { "scroll_preview", config = { direction = 20 } },
					["{"] = {
						function()
							vim.api.nvim_command("vertical resize -5")
						end,
						desc = "Decrease width",
					},
					["}"] = {
						function()
							vim.api.nvim_command("vertical resize +5")
						end,
						desc = "Increase width",
					},
				},
			},
		},
		keys = {
			{ "<leader>e", "<leader>fe", desc = "which_key_ignore", remap = true },
			{ "<leader>E", "<leader>fE", desc = "which_key_ignore", remap = true },
		},
	},
	{
		"echasnovski/mini.files",
		opts = {
			windows = {
				preview = true,
				width_preview = 40,
			},
		},
		keys = {
			{ "<leader>F", "<cmd>lua MiniFiles.open()<cr>", desc = "which_key_ignore" },
		},
	},
	{
		"sindrets/diffview.nvim",
		cmd = "DiffviewOpen",
	},
	{
		"Bekaboo/dropbar.nvim",
		event = "LazyFile",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
		},
	},
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		opts = {
			plugins = {
				wezterm = {
					enabled = true,
					font = "+1",
				},
			},
		},
	},
	{
		"dial.nvim",
		opts = function(_, opts)
			local augend = require("dial.augend")
			local capitalized_boolean = augend.constant.new({
				elements = {
					"True",
					"False",
				},
				word = true,
				cyclic = true,
			})
			table.insert(opts.groups.default, augend.constant.alias.bool)
			table.insert(opts.groups.default, capitalized_boolean)
		end,
      -- stylua: ignore
    keys = {
      { "<C-a>", false, mode = { "n", "v" } },
      { "<C-x>", false, mode = { "n", "v" } },
      { "+", "<Plug>(dial-increment)", desc = "Increment", mode = {"n", "v"} },
      { "-", "<Plug>(dial-decrement)", desc = "Decrement", mode = {"n", "v"} },
    },
	},
}
