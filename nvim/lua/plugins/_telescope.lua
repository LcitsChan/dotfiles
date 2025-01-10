return {
	{
		"telescope.nvim",
		lazy = true,
		cmd = "Telescope",
		opts = function()
			local actions = require("telescope.actions")
			local action_layout = require("telescope.actions.layout")
			return {
				defaults = {
					layout_config = {
						horizontal = {
							preview_cutoff = 40,
							preview_width = 0.5,
						},
					},
					prompt_prefix = "  ",
					mappings = {
						i = {
							["<C-n>"] = actions.cycle_history_next,
							["<C-p>"] = actions.cycle_history_prev,
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-h>"] = action_layout.toggle_preview,
							["<Down>"] = actions.move_selection_next,
							["<Up>"] = actions.move_selection_previous,
							["<C-c>"] = { "<C-u>", type = "command" },
							["<C-o>"] = { "<esc>", type = "command" },
							["<esc>"] = actions.close,
						},

						n = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-h>"] = action_layout.toggle_preview,
							["<esc>"] = actions.close,
							["<CR>"] = actions.select_default,
							["<C-x>"] = actions.select_horizontal,
							["<C-v>"] = actions.select_vertical,
							["<C-t>"] = actions.select_tab,
							["K"] = actions.preview_scrolling_up,
							["J"] = actions.preview_scrolling_down,
							["H"] = actions.preview_scrolling_left,
							["L"] = actions.preview_scrolling_right,
							["o"] = actions.select_default,
							["q"] = actions.close,
						},
					},
				},
				pickers = {
					find_files = {
						layout_config = {
							horizontal = {
								prompt_position = "top",
							},
						},
						sorting_strategy = "ascending",
					},
					current_buffer_fuzzy_find = {
						layout_config = {
							horizontal = {
								prompt_position = "top",
							},
						},
						sorting_strategy = "ascending",
						previewer = false,
					},
				},
			}
		end,
		keys = {
			{ "<leader>/", mode = { "n", "v" }, false },
			-- { "<leader>G", mode = { "n" }, '<cmd>lua LazyVim.pick("live_grep")()<cr>', desc = "Grep Files" },
			-- { "<leader><space>", LazyVim.pick("auto"), desc = "which_key_ignore" },
			-- { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "which_key_ignore" },
		},
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		lazy = true,
		-- cmd = "Telescope",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			local actions = require("telescope.actions")
			local fb_actions = require("telescope._extensions.file_browser.actions")
			require("telescope").setup({
				extensions = {
					file_browser = {
						path = "%:p:h",
						theme = "dropdown",
						preview_cutoff = 40,
						hijack_netrw = true,
						select_buffer = true,
						respect_gitignore = false,
						hidden = true,
						grouped = true,
						initial_mode = "normal",
						mappings = {
							["i"] = {
								["<C-bs>"] = fb_actions.backspace,
							},
							["n"] = {
								["/"] = function()
									vim.cmd("startinsert")
								end,
								["h"] = fb_actions.goto_parent_dir,
								["l"] = actions.select_default,
								["."] = fb_actions.toggle_hidden,
								["I"] = function()
									local telescope = require("telescope")
									telescope.extensions.file_browser.file_browser(
										require("telescope.themes").get_ivy({})
									)
								end,
							},
						},
					},
				},
			})
			require("telescope").load_extension("file_browser")
		end,
		keys = {
			{
				"<leader>i",
				mode = { "n", "v" },
				function()
					local telescope = require("telescope")
					telescope.extensions.file_browser.file_browser({
						previewer = false,
						layout_config = { height = 30 },
					})
				end,
				desc = "which_key_ignore",
			},
		},
	},
	{
		"ahmedkhalf/project.nvim",
		lazy = true,
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("project_nvim").setup({
				require("telescope").load_extension("projects"),
			})
		end,
		keys = {
			{ "<leader>sp", "<cmd>Telescope projects<cr>", mode = "n", desc = "Projects" },
		},
	},
}
