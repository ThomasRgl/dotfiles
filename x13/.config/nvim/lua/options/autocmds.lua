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

-- use 4 spaces for cpp
vim.api.nvim_create_autocmd({ 'FileType' }, {
	pattern = {'cpp', 'cc', 'hpp', 'hh', 'c', 'h'},
	callback = function()
		vim.opt.ts = 4
		vim.opt.sw = 4
		vim.opt.expandtab = true
	end,
})

vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
	callback = function()
		vim.cmd 'set formatoptions-=cro'
	end,
})

--
-- vim.cmd [[
--   augroup packer_user_config
--     au!
--     autocmd BufNewFile,BufRead *.md*   set syntax=markdown
--   augroup end
-- ]]

-- filetype
vim.cmd "autocmd BufNewFile,BufRead *.vs* setfiletype glsl"
vim.cmd "autocmd BufNewFile,BufRead *.fs* setfiletype glsl"
vim.cmd "autocmd BufNewFile,BufRead *.cs* setfiletype glsl"
vim.cmd "autocmd BufNewFile,BufRead *.md* setfiletype markdown"
-- vim.cmd "autocmd BufNewFile,BufRead *.typ setfiletype typst"
-- vim.cmd "autocmd BufNewFile,BufRead *.typst setfiletype typst"

vim.cmd "autocmd BufNewFile,BufRead *.typ setfiletype markdown"

    -- autocmd!
    -- autocmd BufWritePost plugins.lua source <afile> | PackerSync

-- au BufReadPost *.ezt set syntax=html
--
-- augroup twig_ft
--   autocmd BufNewFile,BufRead *.html.twig   set syntax=html
-- augroup END

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
	callback = function()
		vim.highlight.on_yank { higroup = 'Visual', timeout = 200 }
	end,
})
