require "nvchad.options"
local opt = vim.opt
local g = vim.g
local o = vim.o

opt.relativenumber = true
opt.guicursor = ""
opt.scrolloff = 4
opt.sidescrolloff = 4
opt.swapfile = false
opt.timeout = true
opt.timeoutlen = 300
opt.ttimeout = true
opt.ttimeoutlen = 0
opt.updatetime = 200
opt.termguicolors = true
opt.autoindent = true
opt.autoread = true
opt.autowrite = true
opt.backup = false
opt.writebackup = false
opt.backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim"
opt.swapfile = false
opt.showcmd = false
opt.showmode = false

g.did_install_default_menus = 1
g.did_install_syntax_menu = 1
g.did_load_filetypes = 1

-- newtrw liststyle: https://medium.com/usevim/the-netrw-style-options-3ebe91d42456
g.netrw_liststyle = 3

o.cursorlineopt = "both"

-- For auto-session plugin
o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
