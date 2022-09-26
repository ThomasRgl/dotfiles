if not pcall(require, 'impatient') then 
    print 'impatient.nvim not found! '
end



require('packer-config')

require('options.settings')
require('options.mappings')
require('options.autocmds')

--à remettre plus tard
require('lsp')

--plugin conf
require('plugin-config.nvim-tree') --done
require('plugin-config.lualine-evil')
require('plugin-config.which-key')
require('plugin-config.toggleterm')
--require('plugin-config.indent-blankline')
require('plugin-config.cmp')
require('plugin-config.treesitter')
require('plugin-config.dap')
require('plugin-config.trouble')
require('plugin-config.comments')
require('plugin-config.autopairs')



-- color scheme
vim.cmd('colorscheme nordfox')

