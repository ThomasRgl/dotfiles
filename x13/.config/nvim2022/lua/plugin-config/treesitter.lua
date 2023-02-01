local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
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
}
