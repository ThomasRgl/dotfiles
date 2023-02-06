local ok, packer = pcall(require, 'packer')
if not ok then
	print 'packer.nvim not found!'
	return
end
--
--require('packer').init {
--	display = {
--		open_fn = function()
--			return require('packer.util').float { border = 'rounded' }
--		end,
--	},
--}
----
---- Autocommand that reloads neovim whenever you save the plugins.lua file
--vim.cmd [[
--  augroup packer_user_config
--    autocmd!
--    autocmd BufWritePost plugins.lua source <afile> | PackerSync
--  augroup end
--]]

--return require('packer').startup(function(use)
return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- cosmetic
    use 'kyazdani42/nvim-web-devicons' -- icons
    use 'EdenEast/nightfox.nvim'       -- theme
    use 'nvim-lualine/lualine.nvim'
    use 'sunjon/shade.nvim'
    


    -- mapping
    use 'folke/which-key.nvim' -- mapping info



    -- lsp 
    use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    }
    
    --cmp NEW
    --https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
    --
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    --
    use 'onsails/lspkind-nvim'  

    -- cmp OLD ( old hrsh7th config )
    --
    -- use 'hrsh7th/cmp-nvim-lsp'
	-- use 'hrsh7th/cmp-buffer'
	-- use 'hrsh7th/cmp-path'
	-- use 'hrsh7th/cmp-cmdline'
	-- use 'hrsh7th/nvim-cmp'

    -- use 'honza/vim-snippets'
	-- use 'dcampos/nvim-snippy'
	-- use 'dcampos/cmp-snippy'




    -- nvim tree
    use {
	 	'kyazdani42/nvim-tree.lua',
	 	tag = 'nightly', -- optional, updated every week. (see issue #1193)
	}
    
    --treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use 'nvim-treesitter/nvim-treesitter-refactor' --treesitter refactor

    -- telescope
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    

end)

--return packer.startup(function(use)
    -- Packer manager
 --    use 'nvim-lua/plenary.nvim'
  --  use 'wbthomason/packer.nvim'
 --    use 'lewis6991/impatient.nvim'
	--
 --    use 'EdenEast/nightfox.nvim'
	--
 --    -- cosmetique 
 --    use 'nvim-lualine/lualine.nvim'
 --    use 'kyazdani42/nvim-web-devicons'
	-- use 'lukas-reineke/indent-blankline.nvim'
	--
	--
 --    use 'folke/which-key.nvim'
	-- use { 'akinsho/toggleterm.nvim', tag = 'v2.*' }
	-- use 'kdheepak/lazygit.nvim'
	-- --use 'marko-cerovac/material.nvim' theme
	-- --use 'simrat39/rust-tools.nvim' 
	-- use 'windwp/nvim-autopairs'
	-- use 'numToStr/Comment.nvim'
	-- use 'JoosepAlviste/nvim-ts-context-commentstring'
	--
 --    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { { 'nvim-lua/plenary.nvim' } } }
 --    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
	-- --use { 'akinsho/bufferline.nvim', tag = 'v2.*', requires = 'kyazdani42/nvim-web-devicons' }
 --    -- liste de file  
	--
	--
 --    -------------------
 --    -- lsp server
 --    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
 --    use 'jose-elias-alvarez/null-ls.nvim'
	--
 --    use  "williamboman/mason.nvim"
 --    use  "williamboman/mason-lspconfig.nvim"
	--
 --    ---------------------
 --    --cmp
 --    use 'hrsh7th/cmp-nvim-lsp'
	-- use 'hrsh7th/cmp-buffer'
	-- use 'hrsh7th/cmp-path'
	-- use 'hrsh7th/cmp-cmdline'
	-- use 'hrsh7th/nvim-cmp'
	--
 --    use 'honza/vim-snippets'
	-- use 'dcampos/nvim-snippy'
	-- use 'dcampos/cmp-snippy'
	--
 --    ----------------
	-- -- DAP
	-- use 'mfussenegger/nvim-dap'
	-- use 'rcarriga/nvim-dap-ui'
	--
	--
 --    -- latex live 
 --    use 'lervag/vimtex'
	--
	--
 --    use {
	-- 	'kyazdani42/nvim-tree.lua',
	-- 	requires = {
	-- 		'kyazdani42/nvim-web-devicons', -- optional, for file icons
	-- 	},
	-- 	tag = 'nightly', -- optional, updated every week. (see issue #1193)
	-- }
	--
	-- use {
	-- 	'folke/trouble.nvim',
	-- 	requires = 'kyazdani42/nvim-web-devicons',
	-- }
	--
	-- use {
	-- 	'nvim-treesitter/nvim-treesitter',
	-- 	run = function()
	-- 		require('nvim-treesitter.install').update { with_sync = true }
	-- 	end,
	-- }
	-- use {
	-- 	'norcalli/nvim-colorizer.lua',
	-- 	config = function()
	-- 		require('colorizer').setup()
	-- 	end,
	-- }


--end)
