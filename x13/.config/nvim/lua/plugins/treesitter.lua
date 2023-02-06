local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	print 'treesitter not found!'
	return
end

local status_ok, _ = pcall(require, "nvim-treesitter-refactor")
if not status_ok then
	print 'nvim-treesitter-refactor not found!'
	return
end

configs.setup {
	ensure_installed = {
		'bash',
		'c',
		'cpp',
		'go',
		'javascript',
		'typescript',
		'json',
		'lua',
		'python',
		'rust',
		'html',
		'css',
		'toml',
		'latex',
		'markdown',
		'vim',
		'dot',
	},
	ignore_install = { 'haskell' },
	-- matchup = {
	--     enable = true -- mandatory, false will disable the whole extension
	--     -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
	-- },
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { 'html' },
	},
	context_commentstring = { enable = true, config = { css = '// %s' } },
	-- indent = {enable = true, disable = {"python", "html", "javascript"}},
	-- TODO seems to be broken
	indent = { enable = true, disable = { "python", "css" } },
	autotag = { enable = true },
	autopairs = {
		enable = true,
	},

    -- treesitter-refactor
    refactor = {
        --Highlight current scope
--        highlight_current_scope = { enable = true },

        --Smart Rename
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "grr",
            },
        },
    },
}
