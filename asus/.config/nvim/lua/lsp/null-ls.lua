local null_ls_status_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
	debug = false,
	sources = {
		formatting.prettier.with { extra_args = { '--no-semi', '--single-quote', '--jsx-single-quote' } },
		formatting.black.with { extra_args = { '--fast' } },
		formatting.stylua.with { extra_args = { '--quote-style=AutoPreferSingle', '--call-parentheses=None' } },
		formatting.clang_format.with {
			filetypes = { 'c' },
			extra_args = {
				'--style',
				'{AccessModifierOffset : -2, AllowShortIfStatementsOnASingleLine : Never, AlignConsecutiveMacros : true, AllowShortLoopsOnASingleLine : false, AlwaysBreakTemplateDeclarations : true, Standard : c++20, NamespaceIndentation : All, IndentWidth : 4, TabWidth : 4, BreakBeforeBraces : Linux, AllowShortFunctionsOnASingleLine : Empty, AllowShortBlocksOnASingleLine : Never, FixNamespaceComments : true, PointerAlignment : Right, ColumnLimit : 120, ContinuationIndentWidth : 2, UseTab : Always }',
			},
		},
		formatting.clang_format.with {
			filetypes = { 'cpp' },
			extra_args = {
				'--style',
				'google',
			},
		},
		formatting.beautysh,
		formatting.google_java_format,
		formatting.goimports,
		formatting.gofumpt,
		diagnostics.golangci_lint.with {
			extra_args = {
				'-E',
				'revive',
				'-E',
				'errcheck',
				'-E',
				'gosec',
				'-E',
				'nilerr',
				'-E',
				'nlreturn',
			},
		},
		formatting.asmfmt.with {
			filetypes = { 'asm', 's' },
		},
		-- diagnostics.flake8
	},
}
