local luasnip = require 'luasnip'
local cmp = require 'cmp'
local lspkind = require 'lspkind'
-- local vnsip = require 'vsnip'
-- local snippy = require('snippy')

-- this function is only needed for vsnip
-- local feedkey = function(key, mode)
--   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
-- end


function leave_snippet()
    if
        ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
        and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require('luasnip').session.jump_active
    then
        require('luasnip').unlink_current()
    end
end

vim.api.nvim_command([[
    autocmd ModeChanged * lua leave_snippet()
]])


cmp.setup {
  snippet = {
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) --jump bug fix
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()

      -- elseif vim.fn["vsnip#available"](1) == 1 then --jump bug fix
      --   feedkey("<Plug>(vsnip-expand-or-jump)", "")
      -- weird behavior : https://www.reddit.com/r/neovim/comments/um7p7u/nvim_nvimcmp_luasnip_jumps_to_previous_snippets/
      -- elseif luasnip.expand_or_jumpable() then
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()

      -- elseif vim.fn["vsnip#jumpable"](-1) == 1 then --jump bug fix
      --   feedkey("<Plug>(vsnip-jump-prev)", "")
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    -- { name = 'vsnip' }, --jump bug fix
  },

  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        return vim_item
      end
    })
  },
}
