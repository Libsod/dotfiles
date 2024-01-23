local wezterm = require("wezterm")

local config = {

	-- Font settings
	-- font = wezterm.font({ family = "JetBrainsMono Nerd Font" }),
	-- font = wezterm.font_with_fallback({ "Iosevka", "JetBrainsMono Nerd Font" }),
	font = wezterm.font({ family = "Iosevka Nerd Font" }),
	-- font = wezterm.font_with_fallback({ "Dank Mono", "JetBrainsMono Nerd Font" }),
	-- font = wezterm.font_with_fallback({ "Iosevka Nerd Font", "JetBrainsMono Nerd Font" }),

	dpi = 144,
	font_size = 21,
	line_height = 1.4,
	cell_width = 1.0,

	initial_cols = 81,
	initial_rows = 15,

	-- Window settings
	window_decorations = "RESIZE",
	enable_tab_bar = false,
	window_padding = {
		left = 16,
		right = 16,
		top = 16,
		bottom = 16,
	},

	-- Theme settings
	color_scheme = "Mountain_dark",
	color_schemes = {
		["gruvbox_material_dark_hard"] = {
			foreground = "#D4BE98",
			background = "#1D2021",
			cursor_bg = "#D4BE98",
			cursor_border = "#D4BE98",
			cursor_fg = "#1D2021",
			selection_bg = "#D4BE98",
			selection_fg = "#3C3836",

			ansi = { "#1d2021", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
			brights = { "#eddeb5", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
		},
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
	webgpu_power_preference = "LowPower",
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
