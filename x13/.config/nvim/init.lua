-- :h option-list
-- :h option

-- :h vim-lsp
-- :LspInfo
-- :h lspconfig-server-configurations

--if not pcall(require, 'impatient') then
--    print 'impatient.nvim not found! '
--end
--


require('options.settings')

require('packer-config')

require('options.mappings')
require('plugins.which-key')
require('options.autocmds')


require('plugins.nvim-tree')
require('plugins.lualine')
require('plugins.treesitter')
require('plugins.telescope')
--require('plugins.shade')

-- lsp
--require("lsp-config.language-servers")
require('lsp')
--require('lsp-config.nvim-cmp')







--
--require('options.mappings')
--require('options.autocmds')
--
----à remettre plus tard
--
----plugin conf
--require('plugin-config.nvim-tree') --done
--require('plugin-config.lualine')
---- require('plugin-config.lualine')
--require('plugin-config.which-key')
--require('plugin-config.toggleterm')
----require('plugin-config.indent-blankline')
--require('plugin-config.cmp')
--require('plugin-config.treesitter')
--require('plugin-config.dap')
--require('plugin-config.trouble')
--require('plugin-config.comments')
--require('plugin-config.autopairs')
--require('plugin-config.telescope')
--require('plugin-config.vimtex')
--
--
--require('lsp')
---- color scheme


require('colors.nightfox')
--vim.cmd('colorscheme nordfox')

