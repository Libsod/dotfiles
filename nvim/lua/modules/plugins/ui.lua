local ui = {}

ui["Jint-lzxy/nvim"] = {
	lazy = false,
	enabled = false,
	branch = "refactor/syntax-highlighting",
	name = "catppuccin",
	config = require("ui.catppuccin"),
}
ui["sainnhe/gruvbox-material"] = {
	lazy = false,
	name = "gruvbox",
	config = require("ui.gruvbox"),
}
ui["sainnhe/edge"] = {
	lazy = true,
	enabled = false,
	config = require("ui.edge"),
}
ui["j-hui/fidget.nvim"] = {
	lazy = true,
	event = "LspAttach",
	config = require("ui.fidget"),
}
ui["lewis6991/gitsigns.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.gitsigns"),
}
ui["lukas-reineke/indent-blankline.nvim"] = {
	lazy = true,
	main = "ibl",
	event = { "BufReadPost", "BufNewFile" },
	config = require("ui.indent-blankline"),
}
ui["echasnovski/mini.indentscope"] = {
	lazy = true,
	event = { "BufReadPost", "BufNewFile" },
	config = require("ui.mini-indentscope"),
}
ui["nvim-lualine/lualine.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.lualine"),
}
ui["zbirenbaum/neodim"] = {
	lazy = true,
	enabled = false,
	event = "LspAttach",
	config = require("ui.neodim"),
}
ui["karb94/neoscroll.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.neoscroll"),
}
ui["shaunsingh/nord.nvim"] = {
	lazy = true,
	enabled = false,
	config = require("ui.nord"),
}
ui["folke/paint.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.paint"),
}
return ui
