local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

map('n', '<leader>p', ':NvimTreeToggle<cr>', opts)
map('n', '<leader>e', ':help option-list<CR>', opts )
