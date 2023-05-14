local status_ok, mason = pcall(require, 'mason')
if not status_ok then
	print 'mason not found!'
	return
end

local status_ok_1, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status_ok_1 then
	print 'mason-lspconfig not found!'
	return
end

local servers = { 'lua_ls', 'pyright', 'rust_analyzer', 'gopls', 'clangd' }

local settings = {
	ui = {
		border = 'rounded',
		icons = {
			package_installed = '◍',
			package_pending = '◍',
			package_uninstalled = '◍',
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup {
	ensure_installed = servers,
	automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require('lsp.handlers').on_attach,
		capabilities = require('lsp.handlers').capabilities,
	}
	server = vim.split(server, '@')[1]

	if server == 'sumneko_lua' then
		local sumneko_opts = require 'lsp.settings.sumneko_lua'
		opts = vim.tbl_deep_extend('force', sumneko_opts, opts)
	end
	if server == 'clangd' then
		local clangd_flags = {
			'--all-scopes-completion',
			'--suggest-missing-includes',
			'--background-index',
			'--pch-storage=disk',
			'--cross-file-rename',
			'--log=error',
			-- '--log=info',
			'--completion-style=detailed',
			'--enable-config', -- clangd 11+ supports reading from .clangd configuration file
			'--clang-tidy',
            -- "--compile-commands-dir=/home/trgk",
			-- "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type",
			-- "--fallback-style=Google",
			"--header-insertion=never"
			-- "--query-driver=<list-of-white-listed-complers>"
		}
		local clang_opts = {
			arg = { unpack(clangd_flags) },
			--arg = { table.unpack(clangd_flags) },
		}
		opts = vim.tbl_deep_extend('force', clang_opts, opts)
	end
	lspconfig[server].setup(opts)
end

local ok, rt = pcall(require, 'rust-tools')
if not ok then
	return
end

rt.setup {
	server = {
		capabilities = require('lsp.handlers').capabilities,
		on_attach = require('lsp.handlers').on_attach,
	},
}
