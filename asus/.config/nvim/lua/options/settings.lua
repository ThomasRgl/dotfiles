local g = vim.g
local opt = vim.opt

-- Globals 
g.do_filetype_lua = 1
g.did_load_filetypes = 0
g.netrw_liststyle = 1
g.netrw_banner = 0
g.mapleader = ' '
g.tex_flavor = 'latex'

--
opt.termguicolors = true
opt.guifont = 'JetBrainsMono Nerd Font'
--opt.guicursor = 'n-v-c-sm:hor20,i-ci-ve:ver20,r-cr-o:Block'
opt.mouse = 'vin'
opt.path = '.,,**h'
opt.pumheight = 10
opt.fileencoding = 'utf-8'

--tabs
opt.expandtab = true
opt.smarttab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

--search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- window
opt.splitbelow = true
opt.splitright = true
opt.fileencoding = 'utf-8'
opt.termguicolors = true

--cursor
opt.cursorline = true

--lines
opt.wrap = false
opt.scrolloff = 15
opt.number = true

-- !! auto save view!!
--opt.relativenumber = true
opt.hidden = true
opt.undofile = true
opt.updatetime = 300
opt.backup = false
opt.clipboard:prepend { 'unnamedplus' }
opt.viewoptions = 'folds,cursor'
opt.sessionoptions = 'folds'
opt.foldmethod = 'marker'
opt.foldlevel = 0
opt.hidden = true
opt.timeoutlen = 300

opt.fillchars.eob = ' '
opt.autochdir = false
--opt.clipboard='unnamedplus'

--????
opt.iskeyword:prepend { '-' }
opt.inccommand = 'nosplit'
opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.sessionoptions:prepend { 'options', 'resize', 'winpos', 'terminal', 'folds' }

opt.conceallevel = 3
opt.concealcursor = 'n'
opt['foldenable'] = false



