local opt = vim.opt
local g = vim.g

opt.autoread = true
opt.background = 'dark'
opt.binary = true
opt.clipboard = 'unnamedplus'
opt.icon = true
opt.lisp = true
opt.mouse = 'a'
opt.smarttab = true
opt.smoothscroll = true
opt.softtabstop = 2
opt.spell = false
opt.swapfile = false
opt.syntax = 'on'
opt.filetype = 'on'
opt.fileformat = "unix"
opt.autochdir = true
opt.backupcopy = "auto"
opt.updatetime = 300

-- Fold
opt.foldenable = true
opt.foldmethod = "syntax"
opt.foldcolumn = "0"
opt.foldlevel = 99
opt.foldclose = ""

-- Searching
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true

-- UI
opt.number = true
opt.cursorline = true
opt.splitbelow = true
opt.splitright = true
opt.showmode = true
opt.linespace = 0
opt.bufhidden = 'hide'
opt.termguicolors = true
opt.ruler = true

-- Tab
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.cindent = true
