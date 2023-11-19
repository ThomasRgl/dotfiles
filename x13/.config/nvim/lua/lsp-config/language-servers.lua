local status_ok, wk = pcall(require, 'lspconfig')
if not status_ok then
	print 'lspconfig not found!'
	return
end

local status_ok, wk = pcall(require, 'cmp_nvim_lsp')
if not status_ok then
	print 'cmp_nvim_lsp not found!'
	return
end
if  status_ok then
	print 'cmp_nvim_lsp  found!'
	return
end




-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end


local lspconfig = require('lspconfig')
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,       -- Add additional capabilities supported by nvim-cmp
}

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'matlab_ls', 'typst_lsp' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
    flags = lsp_flags;
  }
end

-- require'lspconfig'.typst_lsp.setup{
-- 	settings = {
-- 		exportPdf = "onSave" -- Choose onType, onSave or never.
--         -- serverPath = "" -- Normally, there is no need to uncomment it.
-- 	}
-- }
-- require'lspconfig'.r_language_server.setup({
--   -- on_attach = on_attach_custom,
--   -- Debounce "textDocument/didChange" notifications because they are slowly
--   -- processed (seen when going through completion list with `<C-N>`)
--   -- flags = { debounce_text_changes = 150 },
-- })

--local lsp_flags = {
--  -- This is the default in Nvim 0.7+
--  debounce_text_changes = 150,
--}
--require('lspconfig')['pyright'].setup{
--    on_attach = on_attach,
--    flags = lsp_flags,
--}
--require('lspconfig')['tsserver'].setup{
--    on_attach = on_attach,
--    flags = lsp_flags,
--}
--require('lspconfig')['rust_analyzer'].setup{
--    on_attach = on_attach,
--    flags = lsp_flags,
--    -- Server-specific settings...
--    settings = {
--      ["rust-analyzer"] = {}
--    }
--}
