local M = {}

function M.leader()
	return {
		b = {
			name = "Buffers",
		},
		d = {
			name = "Debug",
		},
		f = {
			name = "Find",
		},
		l = {
			name = "Lsp",
		},
		p = {
			name = "Package",
		},
		s = {
			name = "Session",
		},
	}
end

function M.non_leader()
	return {
		gp = {
			name = "Push & Pull",
		},
	}
end

return M
