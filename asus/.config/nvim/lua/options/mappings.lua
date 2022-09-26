local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

--map('n', '<leader>p', ':NvimTreeToggle<cr>', opts)
--map('n', '<leader>e', ':help option-list<CR>', opts )



----- from settings.lua
--
--
--vim.api.nvim_create_user_command('Pdf', '!pandoc % -o %:r.pdf', { nargs = 0 })
--vim.api.nvim_create_user_command('Slide', '!pandoc -t beamer % -o %:r.pdf', { nargs = 0 })
--vim.api.nvim_create_user_command('Cd', 'lcd %:p:h', { nargs = 0 })
--
--vim.api.nvim_create_autocmd({ 'BufReadPost' }, { pattern = { '*' }, command = 'silent! g`"zz' })
--vim.api.nvim_create_autocmd({ 'BufWinLeave' }, { pattern = { '?*' }, command = 'mkview' })
--vim.api.nvim_create_autocmd({ 'BufReadPost' }, { pattern = { '?*' }, command = 'silent! loadview' })

vim.api.nvim_set_keymap('n', '<BS>', ':', { noremap = true })
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>rs', ':s///gI<Left><Left><Left><Left><Left><Left>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>rr', ':%s///gI<Left><Left><Left><Left>', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>r', ':s///gI<Left><Left><Left><Left>', { noremap = true })


--function MapDHM()
--	vim.api.nvim_set_keymap('n', 'i', 'l', { noremap = true })
--	vim.api.nvim_set_keymap('n', 'n', 'j', { noremap = true })
--	vim.api.nvim_set_keymap('n', 'e', 'k', { noremap = true })
--	vim.api.nvim_set_keymap('v', 'i', 'l', { noremap = true })
--	vim.api.nvim_set_keymap('v', 'n', 'j', { noremap = true })
--	vim.api.nvim_set_keymap('v', 'e', 'k', { noremap = true })
--	vim.api.nvim_set_keymap('n', 'l', 'i', { noremap = true })
--	vim.api.nvim_set_keymap('n', 'N', 'J', { noremap = true })
--	vim.api.nvim_set_keymap('n', 'j', 'n', { noremap = true })
--	vim.api.nvim_set_keymap('n', 'J', 'N', { noremap = true })
--	vim.api.nvim_set_keymap('n', '<nop>', 'I', { noremap = true })
--end
--
--function UnMapDHM()
--	vim.api.nvim_del_keymap('n', 'l')
--	vim.api.nvim_del_keymap('n', 'j')
--	vim.api.nvim_del_keymap('n', 'k')
--	vim.api.nvim_del_keymap('v', 'l')
--	vim.api.nvim_del_keymap('v', 'j')
--	vim.api.nvim_del_keymap('v', 'k')
--	vim.api.nvim_del_keymap('n', 'i')
--	vim.api.nvim_del_keymap('n', 'J')
--	vim.api.nvim_del_keymap('n', 'n')
--	vim.api.nvim_del_keymap('n', 'N')
--end
--
--local handle = io.popen 'lsusb | grep -c Sofle'
--local automap = handle:read '*n'
--handle:close()
--
--if automap == 1 or os.getenv("SSH_TTY") then
--	MapDHM()
--end
