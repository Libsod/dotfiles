local wezterm = require("wezterm")

local config = {

	-- Font settings
	-- font = wezterm.font({ family = "JetBrainsMono Nerd Font" }),
	font = wezterm.font({ family = "Iosevka Nerd Font" }),
	-- font = wezterm.font_with_fallback({ "Dank Mono", "JetBrainsMono Nerd Font" }),

	font_size = 21,
	line_height = 1.3,

	initial_cols = 81,
	initial_rows = 15,
	allow_square_glyphs_to_overflow_width = "Never",

	-- Window settings
	window_decorations = "RESIZE",
	enable_tab_bar = false,
	window_padding = {
		left = 22,
		right = 22,
		top = 24,
		bottom = 24,
	},

	-- Theme settings
	color_scheme = "Mountain_dark",
	color_schemes = {
		["Mountain_dark"] = {
			foreground = "#f0f0f0",
			background = "#0f0f0f",
			cursor_bg = "#ac8aac",
			cursor_fg = "#0f0f0f",
			cursor_border = "#262626",
			split = "#4c4c4c",

			ansi = { "#0f0f0f", "#8aac8b", "#8aabac", "#ac8aac", "#e7e7e8", "#ac8a8c", "#aca98a", "#e7e7e8" },
			brights = { "#4c4c4c", "#93c49f", "#9ec3c4", "#c49ec4", "#f0f0f0", "#c49ea0", "#c4c19e", "#f0f0f0" },
		},
	},

	-- Performance settings
	front_end = "WebGpu",
	prefer_egl = true,
	animation_fps = 240,
	max_fps = 240,

	-- GPU Settings
	webgpu_power_preference = "HighPerformance", -- This is useless for integrated GPU but anyway
	webgpu_preferred_adapter = {
		backend = "Metal",
		device = 0,
		device_type = "IntegratedGpu",
		name = "Apple M1 Pro",
		vendor = 0,
	},

	-- Other settings
	audible_bell = "Disabled",
	cursor_blink_rate = 0,
}

return config
