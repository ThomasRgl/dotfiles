-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})




-- filetype
vim.cmd "autocmd BufNewFile,BufRead *.vs* setfiletype glsl"
vim.cmd "autocmd BufNewFile,BufRead *.fs* setfiletype glsl"
vim.cmd "autocmd BufNewFile,BufRead *.cs* setfiletype glsl"
vim.cmd "autocmd BufNewFile,BufRead *.md* setfiletype markdown"
vim.cmd "autocmd BufNewFile,BufRead *.ll* setfiletype llvm"
-- vim.cmd "autocmd BufNewFile,BufRead *.typ setfiletype typst"
-- vim.cmd "autocmd BufNewFile,BufRead *.typst setfiletype typst"

vim.cmd "autocmd BufNewFile,BufRead *.typ setfiletype markdown"



-- use 4 spaces for cpp
vim.api.nvim_create_autocmd({ 'FileType' }, {
	pattern = {'cpp', 'cc', 'hpp', 'hh', 'c', 'h', 'go'},
	callback = function()
		vim.opt.ts = 4
		vim.opt.sw = 4
		vim.opt.expandtab = true
	end,
})

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
	callback = function()
		vim.cmd 'set formatoptions-=cro'
	end,
})

-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ 'FileType' }, {
	pattern = { 'qf', 'help', 'man', 'lspinfo', 'spectre_panel', 'lir' },
	callback = function()
		vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]]
	end,
})
