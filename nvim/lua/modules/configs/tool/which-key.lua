return function()
	local icons = {
		ui = require("modules.utils.icons").get("ui"),
		misc = require("modules.utils.icons").get("misc"),
	}
	local which_key = require("which-key")
	local which_map = require("keymap.which-key")

	which_key.setup({
		plugins = {
			presets = {
				operators = false,
				motions = false,
				text_objects = false,
				windows = false,
				nav = false,
				z = true,
				g = true,
			},
		},

		icons = {
			breadcrumb = icons.ui.Separator,
			separator = icons.misc.Vbar,
			group = icons.misc.Add,
		},

		window = {
			border = "none",
			position = "bottom",
			margin = { 1, 0, 1, 0 },
			padding = { 1, 1, 1, 1 },
			winblend = 0,
		},
	})
	which_key.register(which_map.leader(), {
		mode = { "n", "v" },
		prefix = "<leader>",
	})

	which_key.register(which_map.non_leader(), {
		mode = { "n", "v" },
	})
end
