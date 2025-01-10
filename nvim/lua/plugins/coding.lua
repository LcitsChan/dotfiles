return {
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		keys = {
			{ "<leader>/" },
		},
		opts = {
			mappings = {
				-- comment = "gc",
				comment_line = "<leader>/",
				comment_visual = "<leader>/",
				textobject = "gc",
			},
		},
	},
	{
		"gbprod/yanky.nvim",
		keys = {
			{
				"<leader>p",
				function()
					if LazyVim.pick.picker.name == "telescope" then
						require("telescope").extensions.yank_history.yank_history({})
					else
						vim.cmd([[YankyRingHistory]])
					end
				end,
				desc = "which_key_ignore",
			},
		},
	},
}
