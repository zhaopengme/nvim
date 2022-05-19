local M = {}
M.setup = function(on_attach, capabilities)
	local lspconfig = require("lspconfig")

	lspconfig.jdtls.setup({
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		},
		capabilities = capabilities,
		cmd = { "jdtls" },
		root_dir = function(fname)
			return require("lspconfig").util.root_pattern("pom.xml", "gradle.build", ".git")(fname) or vim.fn.getcwd()
		end,
	})
end

return M
