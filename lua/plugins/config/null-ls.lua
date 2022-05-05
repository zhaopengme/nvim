local null_ls = Modx.utils.plugins.require("null-ls")

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(clients)
			-- filter out clients that you don't want to use
			return vim.tbl_filter(function(client)
				return client.name ~= "tsserver"
			end, clients)
		end,
		bufnr = bufnr,
	})
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

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
		null_ls.builtins.diagnostics.pydocstyle.with({
			extra_args = { "--config=$ROOT/setup.cfg" },
		}),
		null_ls.builtins.formatting.rustfmt.with({
			extra_args = { "--edition=2021" },
		}),
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
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
})
