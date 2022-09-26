local status_ok, _ = pcall(require, 'nvim-tree')
if not status_ok then
	return
end

local config_status_ok, nvim_tree_config = pcall(require, 'nvim-tree.config')
if not config_status_ok then
	return
end

-- local tree_cb = nvim_tree_config.nvim_tree_callback

require('nvim-tree').setup {
	disable_netrw = true,
	sort_by = 'case_sensitive',
	view = {
		adaptive_size = true,
		mappings = {
			custom_only = true,
			list = {
				{ key = 'h', action = 'dir_up' },
				{ key = { '<CR>', 'o', '<2-LeftMouse>' }, action = 'edit' },
				{ key = '<C-e>', action = 'edit_in_place' },
				{ key = 'O', action = 'edit_no_picker' },
				{ key = { 'i', '<2-RightMouse>' }, action = 'cd' },
				{ key = '<C-v>', action = 'vsplit' },
				{ key = '<C-x>', action = 'split' },
				{ key = '<C-t>', action = 'tabnew' },
				{ key = '<', action = 'prev_sibling' },
				{ key = '>', action = 'next_sibling' },
				{ key = 'P', action = 'parent_node' },
				{ key = '<Tab>', action = 'preview' },
				{ key = 'K', action = 'first_sibling' },
				{ key = 'J', action = 'last_sibling' },
				{ key = 'I', action = 'toggle_git_ignored' },
				{ key = 'H', action = 'toggle_dotfiles' },
				{ key = 'U', action = 'toggle_custom' },
				{ key = 'R', action = 'refresh' },
				{ key = 'a', action = 'create' },
				{ key = 'D', action = 'remove' },
				{ key = 'd', action = 'trash' },
				{ key = 'r', action = 'rename' },
				{ key = '<C-r>', action = 'full_rename' },
				{ key = 'x', action = 'cut' },
				{ key = 'y', action = 'copy' },
				{ key = 'p', action = 'paste' },
				{ key = 'c', action = 'copy_name' },
				{ key = 'C', action = 'copy_path' },
				{ key = 'gc', action = 'copy_absolute_path' },
				{ key = '[e', action = 'prev_diag_item' },
				{ key = '[c', action = 'prev_git_item' },
				{ key = ']e', action = 'next_diag_item' },
				{ key = ']c', action = 'next_git_item' },
				{ key = 's', action = 'system_open' },
				{ key = 'f', action = 'live_filter' },
				{ key = 'F', action = 'clear_live_filter' },
				{ key = 'q', action = 'close' },
				{ key = 'W', action = 'collapse_all' },
				{ key = 'E', action = 'expand_all' },
				{ key = 'S', action = 'search_node' },
				{ key = '.', action = 'run_file_command' },
				{ key = '<C-k>', action = 'toggle_file_info' },
				{ key = 'g?', action = 'toggle_help' },
				{ key = 'm', action = 'toggle_mark' },
				{ key = 'bmv', action = 'bulk_move' },
			},
		},
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
	trash = {
		cmd = 'trash-put',
		require_confirm = false,
	},
	actions = {
		open_file = {
			quit_on_open = false,
		},
	},
}
