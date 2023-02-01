if not pcall(require, 'impatient') then
    print 'impatient.nvim not found! '
end


require('options.settings')


require('packer-config')

require('options.mappings')
require('options.autocmds')

--à remettre plus tard

--plugin conf
require('plugin-config.nvim-tree') --done
require('plugin-config.lualine')
-- require('plugin-config.lualine')
require('plugin-config.which-key')
require('plugin-config.toggleterm')
--require('plugin-config.indent-blankline')
require('plugin-config.cmp')
require('plugin-config.treesitter')
require('plugin-config.dap')
require('plugin-config.trouble')
require('plugin-config.comments')
require('plugin-config.autopairs')
require('plugin-config.telescope')
require('plugin-config.vimtex')


require('lsp')
-- color scheme
vim.cmd('colorscheme nordfox')

