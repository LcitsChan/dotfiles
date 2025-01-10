return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = {
			flavour = "frappe",
			transparent_background = "true",
			integrations = { blink_cmp = true },
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
		end,
	},
	-- {
	-- 	"xiyaowong/transparent.nvim",
	-- 	opts = function(_, opts)
	-- 		vim.g.transparent_enabled = require("catppuccin").options.transparent_background
	-- 		require("transparent").clear_prefix("NeoTree")
	-- 		-- opts.extra_groups = {
	-- 		--   "NormalFloat",
	-- 		--   "Pmenu",
	-- 		--   "Float",
	-- 		--   "NormalFloat",
	-- 		--   "FloatShadow",
	-- 		-- }
	-- 	end,
	-- },
}
