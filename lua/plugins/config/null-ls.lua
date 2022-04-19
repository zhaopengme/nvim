local null_ls = Modx.utils.plugins.require("null-ls")

null_ls.setup({
	debug = false,
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.codespell,
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.shellharden,
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.diagnostics.ansiblelint,
		null_ls.builtins.diagnostics.codespell,
		null_ls.builtins.diagnostics.mypy,
		null_ls.builtins.diagnostics.shellcheck,
		-- null_ls.builtins.formatting.google_java_format,
		-- null_ls.builtins.formatting.prettier.with({
		-- 	-- milliseconds
		-- 	timeout = 10000,
		-- }),
	},
	log = {
		use_console = true,
	},
	on_attach = function(client)
		-- autoformat on save
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync(nil, 1000)")
			-- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
})
