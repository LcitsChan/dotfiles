---@diagnostic disable: undefined-global
return {
	"nvimtools/hydra.nvim",
	lazy = true,
	dependencies = { "lewis6991/gitsigns.nvim", "matze/vim-move" },
	-- event = "LazyFile",
	config = function()
		function Options()
			local Hydra = require("hydra")

			local hint = [[
  ^ ^        Options
  ^
  _v_ %{ve} virtual edit
  _i_ %{list} invisible characters  
  _s_ %{spell} spell
  _w_ %{wrap} wrap
  _c_ %{cul} cursor line
  _n_ %{nu} number
  _r_ %{rnu} relative number
  ^
       ^^^^                _<Esc>_
]]

			Hydra({
				name = "Options",
				hint = hint,
				config = {
					color = "amaranth",
					invoke_on_body = true,
					hint = {
						position = "middle",
					},
				},
				mode = { "n", "x" },
				body = "<leader>O",
				heads = {
					{
						"n",
						function()
							if vim.o.number == true then
								vim.o.number = false
							else
								vim.o.number = true
							end
						end,
						{ desc = "number" },
					},
					{
						"r",
						function()
							if vim.o.relativenumber == true then
								vim.o.relativenumber = false
							else
								vim.o.number = true
								vim.o.relativenumber = true
							end
						end,
						{ desc = "relativenumber" },
					},
					{
						"v",
						function()
							if vim.o.virtualedit == "all" then
								vim.o.virtualedit = "block"
							else
								vim.o.virtualedit = "all"
							end
						end,
						{ desc = "virtualedit" },
					},
					{
						"i",
						function()
							if vim.o.list == true then
								vim.o.list = false
							else
								vim.o.list = true
							end
						end,
						{ desc = "show invisible" },
					},
					{
						"s",
						function()
							if vim.o.spell == true then
								vim.o.spell = false
							else
								vim.o.spell = true
							end
						end,
						{ exit = true, desc = "spell" },
					},
					{
						"w",
						function()
							if vim.o.wrap ~= true then
								vim.o.wrap = true
								-- Dealing with word wrap:
								-- If cursor is inside very long line in the file than wraps
								-- around several rows on the screen, then 'j' key moves you to
								-- the next line in the file, but not to the next row on the
								-- screen under your previous position as in other editors. These
								-- bindings fixes this.
								vim.keymap.set("n", "k", function()
									return vim.v.count > 0 and "k" or "gk"
								end, { expr = true, desc = "k or gk" })
								vim.keymap.set("n", "j", function()
									return vim.v.count > 0 and "j" or "gj"
								end, { expr = true, desc = "j or gj" })
							else
								vim.o.wrap = false
								vim.keymap.del("n", "k")
								vim.keymap.del("n", "j")
							end
						end,
						{ desc = "wrap" },
					},
					{
						"c",
						function()
							if vim.o.cursorline == true then
								vim.o.cursorline = false
							else
								vim.o.cursorline = true
							end
						end,
						{ desc = "cursor line" },
					},
					{ "Q", nil, { exit = true } },
				},
			})
		end
		Options()
		function GitStaff()
			local Hydra = require("hydra")
			local gitsigns = require("gitsigns")

			local hint = [[ Git Staff ]]
			Hydra({
				name = "Git",
				hint = hint,
				config = {
					buffer = bufnr,
					hint = {
						float_opts = {
							style = "minimal",
							border = "rounded",
							focusable = false,
							noautocmd = true,
						},
					},
					color = "pink",
					invoke_on_body = true,
					on_enter = function()
						vim.cmd("mkview")
						vim.cmd("silent! %foldopen!")
						vim.bo.modifiable = false
					end,
					on_exit = function()
						local cursor_pos = vim.api.nvim_win_get_cursor(0)
						vim.cmd("loadview")
						vim.api.nvim_win_set_cursor(0, cursor_pos)
						vim.cmd("normal zv")
					end,
				},
				mode = { "n", "x" },
				body = "<leader>g.",
				heads = {
					{
						"J",
						function()
							if vim.wo.diff then
								return "]c"
							end
							vim.schedule(function()
								gitsigns.next_hunk()
							end)
							return "<Ignore>"
						end,
						{ expr = true, desc = "next hunk" },
					},
					{
						"K",
						function()
							if vim.wo.diff then
								return "[c"
							end
							vim.schedule(function()
								gitsigns.prev_hunk()
							end)
							return "<Ignore>"
						end,
						{ expr = true, desc = "prev hunk" },
					},
					{ "s", ":Gitsigns stage_hunk<CR>", { silent = true, desc = "stage hunk" } },
					{ "u", gitsigns.undo_stage_hunk, { desc = "undo last stage" } },
					{ "S", gitsigns.stage_buffer, { desc = "stage buffer" } },
					{ "p", gitsigns.preview_hunk, { desc = "preview hunk" } },
					{ "d", gitsigns.toggle_deleted, { nowait = true, desc = "toggle deleted" } },
					{ "b", gitsigns.blame_line, { desc = "blame" } },
					{
						"B",
						function()
							gitsigns.blame_line({ full = true })
						end,
						{ desc = "blame show full" },
					},
					{ "/", gitsigns.show, { exit = true, desc = "show base file" } }, -- show the base of the file
					{ "<Enter>", "<Cmd>Neogit<CR>", { exit = true, desc = "Neogit" } },
					{ "Q", nil, { exit = true, nowait = true, desc = "exit " } },
				},
			})
		end
		GitStaff()
		function Movement()
			local Hydra = require("hydra")
			local hint = [[ Movement ]]
			Hydra({
				name = "Movement",
				hint = hint,
				config = {
					buffer = bufnr,
					hint = {
						float_opts = {
							style = "minimal",
							border = "rounded",
							focusable = false,
							noautocmd = true,
						},
					},
					color = "pink",
					invoke_on_body = true,
				},
				mode = { "n", "x" },
				body = "<leader>m",
				desc = "which_key_ignore",
				heads = {
					{
						"J",
						function()
							if vim.api.nvim_get_mode().mode == "n" then
								return "<Plug>MoveLineDown"
							-- vim.cmd([[m +1]])
							else
								return "<Plug>MoveBlockDown"
							end
						end,
						{ expr = true, silent = true, desc = "Move down" },
					},
					{
						"K",
						function()
							if vim.api.nvim_get_mode().mode == "n" then
								return "<Plug>MoveLineUp"
							-- vim.cmd([[m +1]])
							else
								return "<Plug>MoveBlockUp"
							end
						end,
						{ expr = true, silent = true, desc = "Move up" },
					},
					{
						"H",
						function()
							if vim.api.nvim_get_mode().mode == "n" then
								return "<Plug>MoveCharLeft"
							-- vim.cmd([[m +1]])
							else
								return "<Plug>MoveBlockLeft"
							end
						end,
						{ expr = true, silent = true, desc = "Move left" },
					},
					{
						"L",
						function()
							if vim.api.nvim_get_mode().mode == "n" then
								return "<Plug>MoveCharRight"
							-- vim.cmd([[m +1]])
							else
								return "<Plug>MoveBlockRight"
							end
						end,
						{ expr = true, silent = true, desc = "Move right" },
					},
					{
						"m",
						"]m",
						{ silent = true, desc = "Next method" },
					},
					{
						"M",
						"[m",
						{ silent = true, desc = "Prev method" },
					},
					{ "Q", nil, { exit = true, nowait = true, desc = "exit " } },
				},
			})
		end
		Movement()
		function Coding()
			local Hydra = require("hydra")
			local hint = [[ Coding ]]
			Hydra({
				name = "Coding",
				hint = hint,
				config = {
					buffer = bufnr,
					hint = {
						float_opts = {
							style = "minimal",
							border = "rounded",
							focusable = false,
							noautocmd = true,
						},
					},
					color = "pink",
					invoke_on_body = true,
				},
				mode = { "n", "x" },
				body = "<leader>c.",
				desc = "which_key_ignore",
				heads = {
					{
						"<C-a>",
						vim.lsp.buf.code_action,
						{ silent = true, desc = "Code Action" },
					},
					{
						"<C-r>",
						vim.lsp.buf.rename,
						{ noremap = true, desc = "Rename" },
					},
					{
						"<C-f>",
						vim.lsp.buf.format,
						{ silent = true, desc = "Format" },
					},
					{ "Q", nil, { exit = true, nowait = true, desc = "exit " } },
				},
			})
		end
		Coding()
	end,
	keys = {
		{ "<leader>m", desc = "[Hydra] Movement" },
		{ "<leader>O", desc = "[Hydra] Options" },
		{ "<leader>g.", desc = "[Hydra] Git Staff" },
		{ "<leader>c.", desc = "[Hydra] Coding" },
	},
}
