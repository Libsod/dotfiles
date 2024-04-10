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
opt.updatetime = 100
opt.termguicolors = true
g.loaded_remote_plugins = 0
o.cursorlineopt = "both" -- to enable cursorline!
