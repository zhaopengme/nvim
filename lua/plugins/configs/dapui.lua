-- dap-ui configurations
local ok, dapui = pcall(require, "dapui")
if not ok then
	return
end

dapui.setup({
	icons = {
		expanded = "▾",
		collapsed = "▸",
	},
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
	},
	layouts = {
		-- You can change the order of elements in the sidebar
		elements = { -- Provide as ID strings or tables with "id" and "size" keys
			{
				id = "scopes",
				size = 0.25, -- Can be float or integer > 1
			},
			{
				id = "breakpoints",
				size = 0.25,
			},
			{
				id = "stacks",
				size = 0.25,
			},
			{
				id = "watches",
				size = 00.25,
			},
		},
		size = 40,
		position = "left", -- Can be "left", "right", "top", "bottom"
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "single", -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = {
		indent = 1,
	},
})

-- dap.defaults.fallback.terminal_win_cmd = 'ToggleTerm'
vim.fn.sign_define("DapBreakpoint", {
	text = "● ",
	texthl = "DiagnosticSignError",
	linehl = "",
	numhl = "",
})
vim.fn.sign_define("DapBreakpointCondition", {
	text = "● ",
	texthl = "DiagnosticSignWarn",
	linehl = "",
	numhl = "",
})
vim.fn.sign_define("DapLogPoint", {
	text = "● ",
	texthl = "DiagnosticSignInfo",
	linehl = "",
	numhl = "",
})
vim.fn.sign_define("DapStopped", {
	text = "→ ",
	texthl = "DiagnosticSignWarn",
	linehl = "",
	numhl = "",
})
vim.fn.sign_define("DapBreakpointReject", {
	text = "●",
	texthl = "DiagnosticSignHint",
	linehl = "",
	numhl = "",
})
