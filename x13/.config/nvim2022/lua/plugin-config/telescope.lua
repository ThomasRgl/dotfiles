local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
	return
end

local actions = require 'telescope.actions'
local previewers = require 'telescope.previewers'
local Job = require 'plenary.job'
local new_maker = function(filepath, bufnr, opts)
	filepath = vim.fn.expand(filepath)
	Job:new({
		command = 'file',
		args = { '--mime-type', '-b', filepath },
		on_exit = function(j)
			local mime_type = vim.split(j:result()[1], '/')[1]
			if mime_type == 'text' then
				previewers.buffer_previewer_maker(filepath, bufnr, opts)
			else
				-- maybe we want to write something to the buffer here
				vim.schedule(function()
					vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { 'BINARY' })
				end)
			end
		end,
	}):sync()
end

telescope.setup {
	pickers = {
		find_files = {
			theme = 'dropdown',
		},
		live_grep = {
			theme = 'dropdown',
		},
		buffers = {
			theme = 'dropdown',
		},
	},
	defaults = {
		layout_config = {
			vertical = { width = 0.5 },
			-- other layout configuration here
		},
		buffer_previewer_maker = new_maker,
		prompt_prefix = ' ',
		selection_caret = ' ',
		path_display = { 'smart' },
		file_ignore_patterns = { '.git/', 'node_modules' },

		mappings = {
			i = {
				['<Down>'] = actions.move_selection_next,
				['<Up>'] = actions.move_selection_previous,
				['<C-n>'] = actions.cycle_history_next,
				['<C-e>'] = actions.cycle_history_prev,
				['<esc>'] = actions.close,
			},
		},
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case',
			'--trim', -- add this value
		},
	},
}
