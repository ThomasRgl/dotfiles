local status_ok, wk = pcall(require, 'which-key')
if not status_ok then
	print 'which-key not found!'
	return
end

wk.setup {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = true, -- adds help for operators like d, y, ...
			motions = true, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	icons = {
		breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
		separator = '➜ ', -- symbol used between a key and it's label
		group = '+', -- symbol prepended to a group
	},
	window = {
		border = 'none', -- none, single, double, shadow
		position = 'bottom', -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
	},
	hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ' }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
}

local normal_opts = {
	mode = 'n', -- NORMAL mode
	prefix = '<leader>',
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

local visual_opts = {
	mode = 'v', -- VISUAL mode
	prefix = '<leader>',
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

-- MAPS 
-- Set leader
--vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '
-- 

-- resize 
vim.api.nvim_set_keymap('n', '<c-up>', '<cmd>resize -2<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-down>', '<cmd>resize +2<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-left>', '<cmd>vertical resize +2<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-right>', '<cmd>vertical resize -2<cr>', { noremap = true, silent = true })
-- 


-- indent 
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })
-- 


-- open/close folds with enter key 
vim.api.nvim_set_keymap('n', '<cr>', "@=(foldlevel('.')?'za':\"<Space>\")<CR>", { noremap = true, silent = true })
-- 


-- terminal
vim.api.nvim_set_keymap('n', '<home>', '<cmd>ToggleTerm<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<home>', '<cmd>ToggleTerm<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<home>', '<cmd>ToggleTerm<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<home>', '<cmd>ToggleTerm<cr>', { noremap = true, silent = true })
--

-- Telescope
local builtin_telescope = require('telescope.builtin')
--vim.api.nvim_set_keymap('n', 'ff', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', 'fg', '<cmd>Telescope live_grep<cr>' , { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', 'fb', '<cmd>Telescope buffers<cr>'   , { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', 'fh', '<cmd>Telescope<cr>'           , { noremap = true, silent = true })
vim.keymap.set('n', 'ff', builtin_telescope.find_files, {})
vim.keymap.set('n', 'fg', builtin_telescope.live_grep, {})
vim.keymap.set('n', 'fb', builtin_telescope.buffers, {})
vim.keymap.set('n', 'fh', builtin_telescope.help_tags, {})

-- misc 
vim.api.nvim_set_keymap('n', '<c-space>', '<cmd>nohlsearch<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-p>', '"_dp', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'E', ":move '<-2<cr>gv-gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'N', ":move '>+1<cr>gv-gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-\\>', 'z=1<cr><cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', '<cmd>call ColChange()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<cr>', { noremap = true, silent = true })
-- 

-- copy paste + clipboard
vim.api.nvim_set_keymap('v', '<C-y>', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', '"+P', { noremap = true, silent = true })
--

-- vim.api.nvim_set_keymap("n", "", "<cmd><cr>", { noremap = true, silent = true })


local normal_mappings = {
	['rr'] = 'Search and replace all',
	['rs'] = 'Search and replace',

	--   ["b"] = {"<cmd>FindrBuffers<cr>", "List buffers"},
	['k'] = { '<cmd>bd!<cr>', 'Kill buffer' },
	['n'] = { '<cmd>bn<cr>', 'Next buffer' },
	['p'] = { '<cmd>bp<cr>', 'Next buffer' },
	['h'] = { '<cmd>TSBufToggle highlight<cr>', 'Enable TS highlight' },
	['t'] = { '<cmd>TroubleToggle<cr>', 'Trouble' },
	-- ['t'] = { '<cmd>ToggleTerm direction=horizontal<cr>', 'HTerminal' },
	['T'] = { '<cmd>ToggleTerm direction=vertical<cr>', 'VTerminal' },
	['<leader>'] = { '<cmd>NvimTreeToggle<cr>', 'Explorer' },
	['z'] = { '<cmd>TransparentToggle<cr>', 'Toggle Transparancy' },
	['D'] = 'Type definition',
	-- ['rn'] = 'Rename', ????
	['ca'] = 'Code action',
	['1'] = {'<cmd>b 1<cr>', 'Buffer 1'},
	['2'] = {'<cmd>b 2<cr>', 'Buffer 2'},
	['3'] = {'<cmd>b 3<cr>', 'Buffer 3'},
	['4'] = {'<cmd>b 4<cr>', 'Buffer 4'},
	['5'] = {'<cmd>b 5<cr>', 'Buffer 5'},
	o = {
		name = 'Open',
		p = { '<cmd>NvimTreeOpen `dirname $MYVIMRC`<cr>', 'cd to nvim configs' }, --nvim tree reste bloque sur le nvim config
		--v = { '<cmd>NvimTreeOpen ~/vpatuta.xyz/content/<cr>', 'vpatuta.xyz' },
		g = { '<cmd>LazyGit<cr>', 'Lazygit' },
	},
	l = {
		name = 'LSP',
		f = 'Format',
		i = 'Lsp Info',
		I = 'Lsp Install Info',
		a = 'Code action',
		j = 'Next diagnostic',
		k = 'Prev diagnostic',
		r = 'Rename',
		s = 'Signature Help',
		q = 'Set LocList',
	},
	['<TAB>'] = {
		name = 'Tab',
		n = { '<cmd>tabnew<cr>', 'New' },
		p = { '<cmd>tabp<cr>', 'Previous' },
		d = { '<cmd>tabclose<cr>', 'Close' },
		['<TAB>'] = { '<cmd>tabnext<cr>', 'Next' },
		['1'] = { '1gt', 'Go to tab 1' },
		['2'] = { '2gt', 'Go to tab 2' },
		['3'] = { '3gt', 'Go to tab 3' },
		['4'] = { '4gt', 'Go to tab 4' },
		['5'] = { '5gt', 'Go to tab 5' },
		['6'] = { '6gt', 'Go to tab 6' },
		['7'] = { '7gt', 'Go to tab 7' },
		['8'] = { '8gt', 'Go to tab 8' },
		['9'] = { '9gt', 'Go to tab 9' },
	},
	w = {
		name = 'Window',
		v = { '<C-w>v', 'Vertical split' },
		h = { '<C-w>s', 'Horizontal split' },
		a = 'Add workspace folder',
		r = 'Remove workspace folder',
		l = 'List workspace folders',
	},
	f = {
		name = 'Telescope',
		f = {'<cmd>Telescope find_files<cr>', 'Files'},
		g = {'<cmd>Telescope live_grep<cr>', 'Grep'},
		b = {'<cmd>Telescope buffers<cr>', 'Buffers'},
		t = {'<cmd>Telescope<cr>', 'Pickers'},

	},
	d = {
		name = 'DAP',
		b = {"<cmd>lua require'dap'.toggle_breakpoint()<cr>", 'Toggle breakpoint'},
		c = {"<cmd>lua require'dap'.continue()<cr>", 'Continue'},
		i = {"<cmd>lua require'dap'.step_into()<cr>", 'Step into'},
		o = {"<cmd>lua require'dap'.step_over()<cr>", 'Step over'},
		O = {"<cmd>lua require'dap'.step_out()<cr>", 'Step out'},
		r = {"<cmd>lua require'dap'.repl_toggle()<cr>", 'Toggle repl'},
		l = {"<cmd>lua require'dap'.run_last()<cr>", 'Run last'},
		u = {"<cmd>lua require'dapui'.toggle()<cr>", 'UI'},
		t = {"<cmd>lua require'dap'.terminate()<cr>", 'Terminate'},
	}
}


local visual_mappings = {
    w = {
    name = 'refactoring',
    ['e'] = { [[<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], 'Extract Function' },
    ['f'] = { [[<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], 'Extract Function To File ' }, 
    ['v'] = { [[<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], 'Extract Variable' },
    ['i'] = { [[<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], 'Inline Variable' },

    ['b'] = { [[<Esc><Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], 'Extract Block' },
    ['bf'] = { [[<Esc><Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]], 'Extract Block to File' },


    }
        -- ['ri'] = { [[<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], 'Extrac Function' },
}

wk.register(normal_mappings, normal_opts)
wk.register(visual_mappings, visual_opts)
