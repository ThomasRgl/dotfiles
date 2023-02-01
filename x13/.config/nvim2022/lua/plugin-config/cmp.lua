local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
	return
end

local snip_status_ok, snippy = pcall(require, 'snippy')
if not snip_status_ok then
	return
end

local ELLIPSIS_CHAR = '…'
local MAX_LABEL_WIDTH = 20

--[[ local winhighlight = 'NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None' ]]

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
end

cmp.setup {
	view = {
		entries = {
			name = 'custom', -- can be "custom", "wildmenu" or "native"
			-- separator = ' | ',
		},
	},
	completion = {
		autocomplete = false,
	},
	snippet = {
		expand = function(args)
			require('snippy').expand_snippet(args.body)
		end,
	},
	window = {
		--[[ completion = {
			border = 'rounded',
			winhighlight = winhighlight,
		},
		documentation = {
			border = 'rounded',
			winhighlight = winhighlight,
		}, ]]
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	experimental = {
		ghost_text = true,
	},
	formatting = {
		fields = { 'menu', 'abbr', 'kind' },
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = 'λ',
				snippy = '⋗',
				buffer = 'Ω',
				path = '🖫',
			}

			item.menu = menu_icon[entry.source.name]
			local label = item.abbr
			local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
			if truncated_label ~= label then
				item.abbr = truncated_label .. ELLIPSIS_CHAR
			end
			return item
		end,
	},
	mapping = {
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-e>'] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		},
		['<CR>'] = cmp.mapping.confirm { select = true },
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item { behavior = cmp.SelectBehavior.Insert }
			elseif snippy.can_expand_or_advance() then
				snippy.expand_or_advance()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { 'i', 'c', 's' }),

		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item { behavior = cmp.SelectBehavior.Insert }
			elseif snippy.can_jump(-1) then
				snippy.previous()
			else
				fallback()
			end
		end, { 'i', 's', 'c' }),
	},
	sources = cmp.config.sources {
		{ name = 'nvim_lsp' },
		{ name = 'snippy' },
		{ name = 'buffer' },
		{ name = 'path' },
	},
}

cmp.setup.cmdline(':', {
	completion = { autocomplete = true },
	mapping = {
		['<TAB>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item { behavior = cmp.SelectBehavior.Insert }
			else
				cmp.complete()
				cmp.select_next_item { behavior = cmp.SelectBehavior.Insert }
			end
		end, { 'i', 's', 'c' }),
		['<S-TAB>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item { behavior = cmp.SelectBehavior.Insert }
			else
				cmp.complete()
			end
		end, { 'i', 's', 'c' }),
		['<CR>'] = cmp.mapping { i = cmp.mapping.confirm { select = true } },
	},
	sources = {
		{ name = 'cmdline' },
		{ name = 'path' },
	},
	view = {
		entries = { name = 'wildmenu', separator = ' · ' },
	},
})

cmp.setup.cmdline('/', {
	completion = { autocomplete = true },
	sources = {
		{
			name = 'buffer',
		},
	},
	view = {
		entries = { name = 'wildmenu', separator = ' · ' },
	},
})
