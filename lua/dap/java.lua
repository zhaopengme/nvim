local M = {}

function M.setup(dap)
	-- dap.adapters.node2 = {
	-- 	type = "executable",
	-- 	command = "node",
	-- 	args = { vim.fn.stdpath("data") .. "/dapinstall/jsnode/vscode-node-debug2/out/src/nodeDebug.js" },
	-- }
	--
	dap.configurations.java = {
		{
			type = "java",
			request = "attach",
			name = "Java Debug (Attach) - Remote",
			hostName = "127.0.0.1",
			port = 5005,
		},
	}

	require("jdtls").setup_dap()
end

return M
