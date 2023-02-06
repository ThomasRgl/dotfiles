local status_ok, comment = pcall(require, 'Comment')
if not status_ok then
	return
end

comment.setup {
	-- -LHS of operator-pending mappings in NORMAL and VISUAL mode
	opleader = {
		---Line-comment keymap
		line = 'gc',
		---Block-comment keymap
		block = 'gb',
	},
	---LHS of extra mappings
	extra = {
		---Add comment on the line above
		above = 'gcO',
		---Add comment on the line below
		below = 'gco',
		---Add comment at the end of line
		eol = 'gca',
	},
	---Enable keybindings
	---NOTE: If given `false` then the plugin won't create any mappings
	mappings = {
		---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
		basic = true,
		---Extra mapping; `gco`, `gcO`, `gcA`
		extra = true,
		---Extended mapping; `g>` `g<` `g>[count]{motion}` `g<[count]{motion}`
		extended = false,
	},
	pre_hook = function(ctx)
		-- Only calculate commentstring for tsx filetypes
		if vim.bo.filetype == 'typescriptreact' then
			local U = require 'Comment.utils'

			-- Determine whether to use linewise or blockwise commentstring
			local type = ctx.ctype == U.ctype.linewise and '__default' or '__multiline'

			-- Determine the location where to calculate commentstring from
			local location = nil
			if ctx.ctype == U.ctype.blockwise then
				location = require('ts_context_commentstring.utils').get_cursor_location()
			elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
				location = require('ts_context_commentstring.utils').get_visual_start_location()
			end

			return require('ts_context_commentstring.internal').calculate_commentstring {
				key = type,
				location = location,
			}
		end
	end,
}

local ft = require('Comment.ft')
ft({'s', 'asm', 'gp'}, '# %s')
