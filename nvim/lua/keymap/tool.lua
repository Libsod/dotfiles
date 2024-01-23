local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback
require("keymap.helpers")

local plug_map = {
	-- Plugin: vim-fugitive
	["n|gps"] = map_cr("G push"):with_noremap():with_silent():with_desc("git: Push"),
	["n|gpl"] = map_cr("G pull"):with_noremap():with_silent():with_desc("git: Pull"),
	["n|<leader>G"] = map_cu("Git"):with_noremap():with_silent():with_desc("git: Open git-fugitive"),

	-- Plugin: sniprun
	["v|<leader>r"] = map_cr("SnipRun"):with_noremap():with_silent():with_desc("tool: Run code by range"),
	["n|<leader>r"] = map_cu([[%SnipRun]]):with_noremap():with_silent():with_desc("tool: Run code by file"),

	-- Plugin: toggleterm
	["t|<Esc><Esc>"] = map_cmd([[<C-\><C-n>]]):with_noremap():with_silent(), -- switch to normal mode in terminal.
	["t|jk"] = map_cmd([[<C-\><C-n>]]):with_noremap():with_silent(), -- switch to normal mode in terminal.
	["n|<C-\\>"] = map_cr([[execute v:count . "ToggleTerm direction=horizontal"]])
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle horizontal"),
	["i|<C-\\>"] = map_cmd("<Esc><Cmd>ToggleTerm direction=horizontal<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle horizontal"),
	["t|<C-\\>"] = map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle horizontal"),
	["n|<A-\\>"] = map_cr([[execute v:count . "ToggleTerm direction=vertical"]])
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle vertical"),
	["i|<A-\\>"] = map_cmd("<Esc><Cmd>ToggleTerm direction=vertical<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle vertical"),
	["t|<A-\\>"] = map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle vertical"),
	["n|<F5>"] = map_cr([[execute v:count . "ToggleTerm direction=vertical"]])
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle vertical"),
	["i|<F5>"] = map_cmd("<Esc><Cmd>ToggleTerm direction=vertical<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle vertical"),
	["t|<F5>"] = map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle vertical"),
	["n|<A-d>"] = map_cr([[execute v:count . "ToggleTerm direction=float"]])
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle float"),
	["i|<A-d>"] = map_cmd("<Esc><Cmd>ToggleTerm direction=float<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle float"),
	["t|<A-d>"] = map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle float"),
	["n|<leader>g"] = map_callback(function()
			_toggle_lazygit()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("git: Toggle lazygit"),

	-- Plugin: trouble
	["n|<leader>lt"] = map_cr("TroubleToggle"):with_noremap():with_silent():with_desc("lsp: Toggle trouble list"),
	["n|<leader>lR"] = map_cr("TroubleToggle lsp_references")
		:with_noremap()
		:with_silent()
		:with_desc("lsp: Show lsp references"),
	["n|<leader>q"] = map_cr("TroubleToggle document_diagnostics")
		:with_noremap()
		:with_silent()
		:with_desc("lsp: Show document diagnostics"),
	["n|<leader>lw"] = map_cr("TroubleToggle workspace_diagnostics")
		:with_noremap()
		:with_silent()
		:with_desc("lsp: Show workspace diagnostics"),
	["n|<leader>lq"] = map_cr("TroubleToggle quickfix")
		:with_noremap()
		:with_silent()
		:with_desc("lsp: Show quickfix list"),
	["n|<leader>ll"] = map_cr("TroubleToggle loclist"):with_noremap():with_silent():with_desc("lsp: Show loclist"),

	-- Plugin: telescope
	["n|<C-p>"] = map_callback(function()
			_command_panel()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("tool: Toggle command panel"),
	["n|<leader>u"] = map_callback(function()
			require("telescope").extensions.undo.undo()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("edit: Show undo history"),
	["n|<leader>fp"] = map_callback(function()
			require("telescope").extensions.projects.projects({})
		end)
		:with_noremap()
		:with_silent()
		:with_desc("find: Project"),
	["n|<leader>fr"] = map_callback(function()
			require("telescope").extensions.frecency.frecency({})
		end)
		:with_noremap()
		:with_silent()
		:with_desc("find: File by frecency"),
	["n|<leader>fw"] = map_callback(function()
			require("telescope").extensions.live_grep_args.live_grep_args()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("find: Word in project"),
	["n|<leader>fe"] = map_cu("Telescope oldfiles"):with_noremap():with_silent():with_desc("find: File by history"),
	["n|<leader>ff"] = map_cu("Telescope find_files"):with_noremap():with_silent():with_desc("find: File in project"),
	["n|<leader>fc"] = map_cu("Telescope colorscheme")
		:with_noremap()
		:with_silent()
		:with_desc("ui: Change colorscheme for current session"),
	["n|<leader>fn"] = map_cu(":enew"):with_noremap():with_silent():with_desc("buffer: New"),
	["n|<leader>fg"] = map_cu("Telescope git_files")
		:with_noremap()
		:with_silent()
		:with_desc("find: file in git project"),
	["n|<leader>fz"] = map_cu("Telescope zoxide list")
		:with_noremap()
		:with_silent()
		:with_desc("edit: Change current direrctory by zoxide"),
	["n|<leader>fb"] = map_cu("Telescope buffers"):with_noremap():with_silent():with_desc("find: Buffer opened"),
	["n|<leader>ft"] = map_cu("Telescope treesitter"):with_noremap():with_silent():with_desc("find: Symbols"),
	["n|<leader>fs"] = map_cu("Telescope grep_string"):with_noremap():with_silent():with_desc("find: Current word"),
	["n|<leader>fd"] = map_cu("Telescope persisted"):with_noremap():with_silent():with_desc("find: Session"),
	["n|<leader>fh"] = map_cu("Telescope help_tags"):with_noremap():with_silent():with_desc("find: Help"),
	["n|<leader>fH"] = map_cu("Telescope highlights"):with_noremap():with_silent():with_desc("find: Highlight groups"),
	["n|<leader>fR"] = map_cu("Telescope registers"):with_noremap():with_silent():with_desc("find: Registers"),
	["n|<leader>fgc"] = map_cu("Telescope git_commits"):with_noremap():with_silent():with_desc("find: Git commits"),
	["n|<leader>fgC"] = map_cu("Telescope git_bcommits")
		:with_noremap()
		:with_silent()
		:with_desc("find: Git commits for current file"),
	["n|<leader>fgb"] = map_cu("Telescope git_branches"):with_noremap():with_silent():with_desc("find: Git branches"),
	["n|<leader>fgs"] = map_cu("Telescope git_status"):with_noremap():with_silent():with_desc("find: Git status"),
	["n|<leader>fgS"] = map_cu("Telescope git_stash"):with_noremap():with_silent():with_desc("find: Git stash"),

	-- Plugin: spider
	["n|w"] = map_cmd("<cmd>lua require('spider').motion('w')<CR>"):with_noremap():with_silent(),
	["n|e"] = map_cmd("<cmd>lua require('spider').motion('e')<CR>"):with_noremap():with_silent(),
	["n|b"] = map_cmd("<cmd>lua require('spider').motion('b')<CR>"):with_noremap():with_silent(),
	["n|ge"] = map_cmd("<cmd>lua require('spider').motion('ge')<CR>"):with_noremap():with_silent(),

	-- Plugin: harpoon
	["n|<C-e>"] = map_cmd("<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>"):with_noremap():with_silent(),
	["n|<leader>a"] = map_cmd("<cmd>lua require('harpoon.mark').add_file()<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("tool: Mark file to harpoon"),
	["n|<C-w>1"] = map_cmd("<cmd>lua require('harpoon.ui').nav_file(1)<CR>"):with_noremap():with_silent(),
	["n|<C-w>2"] = map_cmd("<cmd>lua require('harpoon.ui').nav_file(2)<CR>"):with_noremap():with_silent(),
	["n|<C-w>3"] = map_cmd("<cmd>lua require('harpoon.ui').nav_file(3)<CR>"):with_noremap():with_silent(),
	["n|<C-w>4"] = map_cmd("<cmd>lua require('harpoon.ui').nav_file(4)<CR>"):with_noremap():with_silent(),
	["n|<C-w>5"] = map_cmd("<cmd>lua require('harpoon.ui').nav_file(5)<CR>"):with_noremap():with_silent(),
	["n|<C-w>6"] = map_cmd("<cmd>lua require('harpoon.ui').nav_file(6)<CR>"):with_noremap():with_silent(),
	["n|<C-w>7"] = map_cmd("<cmd>lua require('harpoon.ui').nav_file(7)<CR>"):with_noremap():with_silent(),
	["n|<C-w>8"] = map_cmd("<cmd>lua require('harpoon.ui').nav_file(8)<CR>"):with_noremap():with_silent(),
	["n|<C-w>9"] = map_cmd("<cmd>lua require('harpoon.ui').nav_file(9)<CR>"):with_noremap():with_silent(),
	["n|<Tab>"] = map_cmd("<cmd>lua require('harpoon.ui').nav_next()<CR>"):with_noremap():with_silent(),
	["n|<S-Tab>"] = map_cmd("<cmd>lua require('harpoon.ui').nav_prev()<CR>"):with_noremap():with_silent(),

	-- Plugin: Which-key
	["n|<leader><leader>w"] = map_cmd("<cmd>lua vim.cmd 'WhichKey'<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("tool: All keymaps"),

	-- Plugin: dap
	["n|<F6>"] = map_callback(function()
			require("dap").continue()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Run/Continue"),
	["n|<F7>"] = map_callback(function()
			require("dap").terminate()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Stop"),
	["n|<F8>"] = map_callback(function()
			require("dap").toggle_breakpoint()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Toggle breakpoint"),
	["n|<F9>"] = map_callback(function()
			require("dap").step_into()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Step into"),
	["n|<F10>"] = map_callback(function()
			require("dap").step_out()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Step out"),
	["n|<F11>"] = map_callback(function()
			require("dap").step_over()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Step over"),
	["n|<leader>db"] = map_callback(function()
			require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Set breakpoint with condition"),
	["n|<leader>dc"] = map_callback(function()
			require("dap").run_to_cursor()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Run to cursor"),
	["n|<leader>dl"] = map_callback(function()
			require("dap").run_last()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Run last"),
	["n|<leader>do"] = map_callback(function()
			require("dap").repl.open()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Open REPL"),
}

bind.nvim_load_mapping(plug_map)
