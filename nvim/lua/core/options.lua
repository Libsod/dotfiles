local global = require("core.global")

local function load_options()
	local global_local = {
		-- backupdir = global.cache_dir .. "backup/",
		-- directory = global.cache_dir .. "swap/",
		-- spellfile = global.cache_dir .. "spell/en.uft-8.add",
		-- viewdir = global.cache_dir .. "view/",
		autoindent = true,
		autoread = true,
		autowrite = true,
		backspace = "indent,eol,start",
		backup = false,
		backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/sm/*,/private/var/*,.vault.vim",
		breakat = [[\ \ ;:,!?]],
		breakindentopt = "shift:2,min:20",
		clipboard = "unnamedplus",
		cmdheight = 1, -- 0, 1, 2
		cmdwinheight = 6,
		complete = ".,w,b,k",
		completeopt = "menu,menuone",
		concealcursor = "niv",
		conceallevel = 0,
		guicursor = "",
		cursorcolumn = false,
		cursorline = true,
		diffopt = "filler,iwhite,internal,linematch:60,algorithm:patience",
		display = "lastline",
		encoding = "utf-8",
		-- vim.highlight.priorities.semantic_tokens == 95,
		equalalways = false,
		confirm = false,
		errorbells = true,
		expandtab = true,
		fileformats = "unix,mac,dos",
		foldenable = true,
		foldexpr = "nvim_treesitter#foldexpr()",
		foldlevelstart = 99,
		formatoptions = "1jcroql",
		grepformat = "%f:%l:%c:%m",
		grepprg = "rg --hidden --vimgrep --smart-case --",
		helpheight = 12,
		hidden = true,
		history = 1000,
		ignorecase = true,
		inccommand = "nosplit",
		incsearch = true,
		infercase = true,
		jumpoptions = "stack",
		laststatus = 3,
		linebreak = true,
		list = false,
		listchars = "nbsp:+,extends:→,precedes:←",
		magic = true,
		mousescroll = "ver:3,hor:6",
		number = true,
		previewheight = 12,
		-- Do NOT adjust the following option (pumblend) if you're using transparent background
		pumblend = 0,
		pumheight = 10,
		redrawtime = 1500,
		relativenumber = true,
		ruler = false,
		scrolloff = 8,
		sessionoptions = "buffers,curdir,folds,help,tabpages,winpos,winsize",
		shada = "!,'500,<50,@100,s10,h",
		shiftround = true,
		shiftwidth = 2,
		shortmess = "aOTIcF",
		-- vim.g.markdown_recommended_style == 0,
		showbreak = "↳  ",
		showcmd = false,
		fileencoding = "UTF-8",
		showmode = false,
		showtabline = 0,
		sidescrolloff = 8,
		signcolumn = "yes",
		smartcase = true,
		smarttab = true,
		smartindent = true,
		softtabstop = 2,
		splitbelow = true,
		splitkeep = "screen",
		splitright = true,
		startofline = true,
		swapfile = false,
		switchbuf = "usetab,uselast",
		synmaxcol = 2500,
		tabstop = 2,
		termguicolors = true,
		timeout = true,
		timeoutlen = 300,
		ttimeout = true,
		ttimeoutlen = 0,
		-- undodir = global.cache_dir .. "undo/",
		undofile = true,
		-- Please do NOT set `updatetime` to above 500, otherwise most plugins may not function correctly
		updatetime = 100,
		viewoptions = "folds,cursor,curdir,slash,unix",
		virtualedit = "block",
		visualbell = false,
		whichwrap = "h,l,<,>,[,],~",
		wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
		wildignorecase = true,
		-- Do NOT adjust the following option (winblend) if you're using transparent background
		winblend = 0,
		winminwidth = 10,
		winwidth = 30,
		wrap = false,
		wrapscan = true,
		writebackup = false,
	}

	local function isempty(s)
		return s == nil or s == ""
	end
	local function use_if_defined(val, fallback)
		return val ~= nil and val or fallback
	end

	-- custom python provider
	local conda_prefix = os.getenv("CONDA_PREFIX")
	if not isempty(conda_prefix) then
		vim.g.python_host_prog = use_if_defined(vim.g.python_host_prog, conda_prefix .. "/bin/python")
		vim.g.python3_host_prog = use_if_defined(vim.g.python3_host_prog, conda_prefix .. "/bin/python")
	else
		vim.g.python_host_prog = use_if_defined(vim.g.python_host_prog, "python")
		vim.g.python3_host_prog = use_if_defined(vim.g.python3_host_prog, "python3")
	end

	for name, value in pairs(global_local) do
		vim.o[name] = value
	end

	local sqlite_clib_path = os.getenv("SQLITE_CLIB_PATH")
	-- Try environment variable first
	if not isempty(sqlite_clib_path) then
		vim.g.sqlite_clib_path = sqlite_clib_path
	end
end

load_options()
