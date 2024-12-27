local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	default_cursor_style = "BlinkingBar",
	font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" }),
	font_size = 12,
	window_padding = {
		left = 3,
		right = 3,
		top = 0,
		bottom = 0
	},
	window_background_opacity = 1
}

return config
