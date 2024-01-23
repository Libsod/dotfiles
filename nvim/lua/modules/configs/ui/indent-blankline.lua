return function()
	-- Hl settings
	local indent_blankline = require("core.highlights")
	indent_blankline.highlight_indent_blankline()

	require("ibl").setup({
		debounce = 200,
		indent = { char = "│", priority = 1 },
		scope = { enabled = false },
		exclude = {
			filetypes = {
				"Mason",
				"dashboard",
				"big_file_disabled_ft",
				"fugitive",
				"git",
				"json",
				"log",
				"markdown",
				"peekaboo",
				"startify",
				"todoist",
				"txt",
				"help",
				"undotree",
				"vimwiki",
				"vista",
				"Trouble",
				"lazy",
				"",
			},
		},
	})
end
