local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_cmp_ok then
	print 'cmp_nvim_lsp not found!'
	return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities.offsetEncoding = { "utf-16" }
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

--vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]

M.setup = function()
	local config = {
		virtual_text = true,
		signs = false,
		underline = true,
		update_in_insert = false,
		severity_sort = true,
		float = {
			focusable = true,
			style = 'minimal',
			border = 'rounded',
			source = 'always',
			header = '',
			prefix = '',
		},
	}
	vim.diagnostic.config(config)

	vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = 'rounded',
	})

	vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = 'rounded',
	})

	--[[ local on_references = vim.lsp.handlers['textDocument/references'] ]]
	--[[ vim.lsp.handlers['textDocument/references'] = vim.lsp.with(on_references, { ]]
	--[[ 	-- Use location list instead of quickfix list ]]
	--[[ 	loclist = true, ]]
	--[[ }) ]]
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	keymap(bufnr, 'n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts) -- TODO override by grr smart refactor
	keymap(bufnr, 'n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
	keymap(bufnr, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<cr>', opts)
	keymap(bufnr, 'n', '<leader>li', '<cmd>LspInfo<cr>', opts)
	keymap(bufnr, 'n', '<leader>lI', '<cmd>LspInstallInfo<cr>', opts)
	keymap(bufnr, 'n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
	keymap(bufnr, 'n', '<leader>lj', '<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>', opts)
	keymap(bufnr, 'n', '<leader>lk', '<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>', opts)
	keymap(bufnr, 'n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
	keymap(bufnr, 'n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	keymap(bufnr, 'n', '<leader>lq', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
	keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
end


M.on_attach = function(client, bufnr)
	--[[ vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc') ]]
	lsp_keymaps(bufnr)
	if client.name == 'sumneko_lua' then
		client.server_capabilities.documentFormattingProvider = false
	end
	if client.name == 'clangd' then
		client.server_capabilities.documentFormattingProvider = false
	end
	if client.name == 'gopls' then
		client.server_capabilities.documentFormattingProvider = false
	end
	if client.name == 'jdtls' then
		client.server_capabilities.documentFormattingProvider = false
	end
	--if client.name == 'jdt.ls' then
	--	client.server_capabilities.documentFormattingProvider = false
	--	vim.lsp.codelens.refresh()
	--	if JAVA_DAP_ACTIVE then
	--		require('jdtls').setup_dap { hotcodereplace = 'auto' }
	--		require('jdtls.dap').setup_dap_main_class_configs()
	--	end
	--end
end

return M
