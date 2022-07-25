return require('packer').startup(function()
    -- Packer manager
    use 'wbthomason/packer.nvim'
    
    -- colorscheme
    use 'EdenEast/nightfox.nvim'
    
    -- tree
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
   
    -- lsp server
    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    
        --autocompletion
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin

    
end)
