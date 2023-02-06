local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
	print 'lspconfig not found!'
	return
end

require 'lsp.lsp-installer'
require('lsp.handlers').setup()
--require 'lsp.null-ls'

require('lsp.nvim-cmp')
