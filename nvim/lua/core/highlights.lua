local M = {}

function M.highlight_nvim()
	local hl_groups = {
		-- Nvim float windows
		NormalFloat = { bg = "#181B1C" },
	}
	for name, hl in pairs(hl_groups) do
		vim.api.nvim_set_hl(0, name, hl)
	end
end

function M.highlight_mason()
	local hl_groups = {
		-- Mason plugin
		MasonHeader = { fg = "#222222", bg = "#DCA561", default = true },
		MasonHeaderSecondary = { bold = true, fg = "#222222", bg = "#56B6C2", default = true },
	}
	for name, hl in pairs(hl_groups) do
		vim.api.nvim_set_hl(0, name, hl)
	end
end

function M.highlight_indent_blankline()
	local hl_groups = {
		-- Indent-blankline plugin
		IblIndent = { fg = "#2D3233" },
	}
	for name, hl in pairs(hl_groups) do
		vim.api.nvim_set_hl(0, name, hl)
	end
end

function M.highlight_mini_indentscope()
	local hl_groups = {
		-- Mini-indentscope plugin
		MiniIndentscopeSymbol = { fg = "#89b482" },
	}
	for name, hl in pairs(hl_groups) do
		vim.api.nvim_set_hl(0, name, hl)
	end
end

function M.highlight_cmp()
	local hl_groups = {
		-- Cmp plugin
		PmenuSel = { bg = "NONE", fg = "#1d2021" },
		Pmenu = { bg = "#181B1C", fg = "NONE" },
		CmpItemAbbrDeprecated = { bg = "NONE", fg = "#B3504B" },
		CmpItemAbbrMatch = { bg = "NONE", fg = "#89b482", bold = true },
		CmpItemAbbrMatchFuzzy = { bg = "NONE", fg = "#89b482", bold = true },
		CmpItemMenu = { bg = "NONE", fg = "#7daea3", bold = true },
		CmpItemKindField = { fg = "#ea6962" },
		CmpItemKindProperty = { fg = "#ea6962" },
		CmpItemKindEvent = { fg = "#ea6962" },
		CmpItemKindText = { fg = "#a9b665" },
		CmpItemKindEnum = { fg = "#a9b665" },
		CmpItemKindKeyword = { fg = "#a9b665" },
		CmpItemKindConstant = { fg = "#d8a657" },
		CmpItemKindConstructor = { fg = "#d8a657" },
		CmpItemKindReference = { fg = "#d8a657" },
		CmpItemKindFunction = { fg = "#d3869b" },
		CmpItemKindStruct = { fg = "#d3869b" },
		CmpItemKindClass = { fg = "#d3869b" },
		CmpItemKindModule = { fg = "#d3869b" },
		CmpItemKindVariable = { fg = "#ea6962" },
		CmpItemKindFile = { fg = "#ea6962" },
		CmpItemKindUnit = { fg = "#e78a4e" },
		CmpItemKindSnippet = { fg = "#e78a4e" },
		CmpItemKindFolder = { fg = "#e78a4e" },
		CmpItemKindValue = { fg = "#7daea3" },
		CmpItemKindEnumMember = { fg = "#7daea3" },
		CmpItemKindInterface = { fg = "#89b482" },
		CmpItemKindColor = { fg = "#89b482" },
		CmpItemKindTypeParameter = { fg = "#89b482" },
	}
	for name, hl in pairs(hl_groups) do
		vim.api.nvim_set_hl(0, name, hl)
	end
end

function M.highlight_lspsaga()
	local hl_groups = {
		-- LspSaga plugin
		HoverNormal = { bg = "#181B1C" },
		HoverBorder = { bg = "#181B1C" },
		RenameNormal = { bg = "#1E2021" },
		RenameBorder = { bg = "#181B1C" },
	}
	for name, hl in pairs(hl_groups) do
		vim.api.nvim_set_hl(0, name, hl)
	end
end

return M
