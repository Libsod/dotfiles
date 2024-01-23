return function()
	local mini_indentscope_hl = require("core.highlights")
	mini_indentscope_hl.highlight_mini_indentscope()

	require("mini.indentscope").setup({
		symbol = "│",
		options = {
			try_as_border = true,
		},
	})
end
