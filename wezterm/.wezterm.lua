local wezterm = require("wezterm")
local act = wezterm.action
local image_url = os.getenv("HOME") .. "/Pictures/backgroud.jpg"
local config = {
	color_scheme = "Catppuccin Frappe",
	command_palette_font_size = 24.0,
	-- color_scheme = "Nova (base16)",
	font = wezterm.font({ family = "JetBrainsMono Nerd Font Mono", weight = "Regular" }),
	quit_when_all_windows_are_closed = true,
	-- window_background_image = image_url,
	window_background_image_hsb = {
		-- Darken the background image by reducing it to 1/3rd
		brightness = 0.1,

		-- You can adjust the hue by scaling its value.
		-- a multiplier of 1.0 leaves the value unchanged.
		hue = 1.0,

		-- You can adjust the saturation also.
		saturation = 1.0,
	},
	font_size = 20.0,
	audible_bell = "Disabled",
	use_fancy_tab_bar = false,
	window_decorations = "RESIZE",
	default_cwd = os.getenv("HOME"),
	window_background_opacity = 0.9,
	macos_window_background_blur = 20,
	hide_tab_bar_if_only_one_tab = true,
	adjust_window_size_when_changing_font_size = false,
	show_new_tab_button_in_tab_bar = false,
	scrollback_lines = 8888,
	window_padding = {
		left = 8,
		right = 8,
		top = 8,
		bottom = 0,
	},
	send_composed_key_when_right_alt_is_pressed = false,
	leader = { key = "a", mods = "CMD", timeout_milliseconds = 1000 },
	keys = {
		{ key = "Enter", mods = "CMD", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "'", mods = "CMD", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "p", mods = "CMD", action = act.ActivateCommandPalette },
		{ key = "t", mods = "CMD", action = act({ SpawnCommandInNewTab = { cwd = wezterm.home_dir } }) },
		{ key = "l", mods = "CMD", action = act.ClearScrollback("ScrollbackOnly") },

		-- Resize
		{ key = "h", mods = "SHIFT|CTRL", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "l", mods = "SHIFT|CTRL", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "k", mods = "SHIFT|CTRL", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "j", mods = "SHIFT|CTRL", action = act.AdjustPaneSize({ "Down", 1 }) },

		{ key = "=", mods = "CTRL", action = "DisableDefaultAssignment" },
		{ key = "-", mods = "CTRL", action = "DisableDefaultAssignment" },
		{ key = "=", mods = "SHIFT|CTRL", action = "DisableDefaultAssignment" },
		{ key = "-", mods = "SHIFT|CTRL", action = "DisableDefaultAssignment" },
		{ key = "+", mods = "CTRL", action = "DisableDefaultAssignment" },
		{ key = "_", mods = "CTRL", action = "DisableDefaultAssignment" },

		-- Navigation
		{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
		{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
		{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
		{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
		{ key = "h", mods = "SHIFT|CMD", action = act.ActivatePaneDirection("Left") },
		{ key = "l", mods = "SHIFT|CMD", action = act.ActivatePaneDirection("Right") },
		{ key = "k", mods = "SHIFT|CMD", action = act.ActivatePaneDirection("Up") },
		{ key = "j", mods = "SHIFT|CMD", action = act.ActivatePaneDirection("Down") },
		{ key = ";", mods = "CMD", action = act.ActivateLastTab },

		-- Screen
		{ key = "u", mods = "SHIFT|CTRL", action = act.ScrollByPage(-0.5) },
		{ key = "[", mods = "SHIFT|CTRL", action = act.ScrollByPage(-1) },
		{ key = "d", mods = "SHIFT|CTRL", action = act.ScrollByPage(0.5) },
		{ key = "]", mods = "SHIFT|CTRL", action = act.ScrollByPage(1) },
	},
}
wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)
return config
