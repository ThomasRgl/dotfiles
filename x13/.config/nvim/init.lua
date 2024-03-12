vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- lazy bootstrap
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

-- require("lazy").setup("plugins", {
--   change_detection = { notify = false },
-- })


require("lazy_setup")


require("settings")
require("mappings")
require("autocmds")
require("colorschemes")



-- require("oldlsp.lsp")
-- require("oldlsp.nvim-cmp")


