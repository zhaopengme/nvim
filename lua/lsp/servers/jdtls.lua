local M = {}
M.setup = function(on_attach, capabilities)
	local lspconfig = require("lspconfig")

	local on_attach2 = function(client, bufnr)
		require("jdtls").setup_dap({
			hotcodereplace = "auto",
		})
		require("jdtls.dap").setup_dap_main_class_configs()
		require("jdtls.setup").add_commands()
		vim.cmd([[
         command! -buffer JdtCompile lua require('jdtls').compile()
         command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
         command! -buffer JdtJol lua require('jdtls').jol()
         command! -buffer JdtBytecode lua require('jdtls').javap()
         command! -buffer JdtJshell lua require('jdtls').jshell()
         command! -buffer JdtSetupDapMainClassConfig lua require('jdtls.dap').setup_dap_main_class_configs()
      ]])
	end

	lspconfig.jdtls.setup({
		on_attach = on_attach2,
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
