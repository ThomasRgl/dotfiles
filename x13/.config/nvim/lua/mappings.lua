-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.api.nvim_create_user_command('Pdf', '!pandoc % -o %:r.pdf', { nargs = 0 })
vim.api.nvim_create_user_command('Slide', '!pandoc -t beamer % -o %:r.pdf', { nargs = 0 })
vim.api.nvim_create_user_command('Cd', 'lcd %:p:h', { nargs = 0 })

vim.api.nvim_set_keymap('n', '<BS>', ':', { noremap = true })
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>rs', ':s///gI<Left><Left><Left><Left><Left><Left>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>rr', ':%s///gI<Left><Left><Left><Left>', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>r', ':s///gI<Left><Left><Left><Left>', { noremap = true })



-- refactoring remaps
-- Remaps for the refactoring operations currently offered by the plugin
vim.api.nvim_set_keymap("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

-- Extract block doesn't need visual mode
vim.api.nvim_set_keymap("n", "<leader>rb", [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>rbf", [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]], {noremap = true, silent = true, expr = false})

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
vim.api.nvim_set_keymap("n", "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})



-- copy file path to clipboard
vim.api.nvim_set_keymap('n', '<leader>y', ':let @+ = expand("%:p")<CR>', { noremap = true, silent = true, desc = 'Copy file path to clipboard' })


-- resize
vim.api.nvim_set_keymap('n', '<c-up>', '<cmd>resize -2<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-down>', '<cmd>resize +2<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-left>', '<cmd>vertical resize +2<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-right>', '<cmd>vertical resize -2<cr>', { noremap = true, silent = true })
-- 


-- indent 
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })
-- 


-- open/close folds with enter key 
vim.api.nvim_set_keymap('n', '<cr>', "@=(foldlevel('.')?'za':\"<Space>\")<CR>", { noremap = true, silent = true })
-- 


