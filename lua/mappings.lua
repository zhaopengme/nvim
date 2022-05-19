local ok, wk = pcall(require, "which-key")

if not ok then
	return
end

local opts = {
	mode = "n",
	prefix = "<leader>",
	silent = true,
	noremap = true,
	nowait = true,
}

local mappings = {
	e = { ":NvimTreeToggle<cr>", "File Explorerer" },
	f = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files<cr>", "Find Files" },
		r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
		b = { "<cmd>Telescope buffers<cr>", "Buffers" },
	},
	l = {
		name = "LSP",
		-- i = {":LspInfo<cr>", "Connected Language Servers"},
		-- f = {"<cmd>lua vim.diagnostic.open_float()<CR>", "diagnostic open float"},
		-- k = {"<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help"},
		-- K = {"<cmd>lua vim.lsp.buf.hover()<CR>", "Hover"},
		-- w = {"<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add workspace folder"},
		-- W = {"<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove workspace folder"},
		-- l = {"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List workspace folder"},
		-- t = {"<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type definition"},
		-- d = {"<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition"},
		-- D = {"<cmd>lua vim.lsp.buf.delaration()<CR>", "Go to declaration"},
		-- r = {"<cmd>lua vim.lsp.buf.references()<CR>", "References"},
		-- R = {"<cmd>lua vim.lsp.buf.rename()<CR>", "Rename"},
		-- A = {"<cmd>lua vim.lsp.buf.code_action()<CR>", "Code actions"},
		-- e = {"<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "Show line diagnostics"},
		-- n = {"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Go to next diagnostic"},
		-- N = {"<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", "Go to previous diagnostic"}

		n = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "[SAGA] Diagnostic jump next" },
		p = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "[SAGA] Diagnostic jump previous" },
		d = { "<cmd>Lspsaga preview_definition<cr>", "[SAGA] Preview definition" },
		x = { "<cmd>Lspsaga lsp_finder<cr>", "[SAGA] LSP Finder" },
		a = { "<cmd>Lspsaga code_action<cr>", "[SAGA] Code Action" },
		R = { "<cmd>Lspsaga rename<cr>", "[SAGA] Rename" },
	},
	-- x = { ":bdelete<cr>", "Close Buffer" },
	x = { ":BufferLineCloseLeft<cr>:BufferLineCloseRight<cr>", "Close Other Buffers" },
	q = { ":q!<cr>", "Force Quit" },
	w = { ":w<cr>", "Write" },
	p = {
		name = "Packer",
		r = { ":PackerClean<cr>", "Remove Unused Plugins" },
		c = { ":PackerCompile profile=true<cr>", "Recompile Plugins" },
		i = { ":PackerInstall<cr>", "Install Plugins" },
		p = { ":PackerProfile<cr>", "Packer Profile" },
		s = { ":PackerSync<cr>", "Sync Plugins" },
		S = { ":PackerStatus<cr>", "Packer Status" },
		u = { ":PackerUpdate<cr>", "Update Plugins" },
	},
	d = {
		name = "Debug",
		t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
		b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
		c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
		C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
		d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
		g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
		i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
		o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
		u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
		p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
		r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
		s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
		l = { "<cmd>lua require'dap'.run_last()<cr>", "Run Last" },
		q = { "<cmd>lua require'dap'.close()<cr>", "Stop" },
		v = { "<cmd>lua require'dapui'.toggle()<cr>", "dapui" },
	},
	c = {
		name = "Code",
		x = { "<cmd>TroubleToggle<CR>", "TroubleToggle" },
		q = { "<cmd>TroubleToggle quickfix<CR>", "TroubleToggle quickfix" },
		o = { "<cmd>SymbolsOutline<CR>", "Symbols Outline" },
		u = { "<cmd>lua require('jdtls').update_project_config()<CR>", "Java Update Project Config" },
	},

	s = {
		name = "Search Replace",
		s = { "<cmd>Telescope live_grep<cr>", "Search Text" },
		r = { "<cmd>lua require('spectre').open()<cr>", "Search Replace" },
		w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Search Current Word" },
		c = { "<cmd>lua require('spectre').open_file_search()<cr>", "Search Current File" },
		-- r = {"<cmd>lua require('spectre').toggle_line()<CR>", "Replace"},
		a = { "<cmd>lua require('spectre.actions').run_replace()<cr>", "Replace All" },
	},
	z = {
		name = "Focus",
		z = { ":ZenMode<cr>", "Toggle Zen Mode" },
		t = { ":Twilight<cr>", "Toggle Twilight" },
	},
	g = { ":LazyGit<cr>", "LazyGit" },
}

wk.register(mappings, opts)

-- wk.register({
--     -- Buffer
--     ["<leader>]"] = {"<cmd>bn<cr>", "[BUFFER] Go previous buffer"},
--     ["<leader>["] = {"<cmd>bp<cr>", "[BUFFER] Go next buffer"},
--     ["<leader>q"] = {"<cmd>bd<cr>", "[BUFFER] Close current buffer"},

--     -- [[ Nvimtree ]]
--     ["<leader>e"] = {"<cmd>NvimTreeToggle<cr> <cmd>NvimTreeRefresh<cr>", "[NVIMTREE] Toggle"},

--     -- [[ Telescope ]]
--     ["<leader>f"] = {
--         name = "[TELESCOPE]",
--         f = {"<cmd>Telescope find_files hidden=true no_ignore=true<cr>", "[TELESCOPE] Find File"},
--         g = {"<cmd>Telescope live_grep<cr>", "[TELESCOPE] Find File by grep"},
--         b = {"<cmd>Telescope buffers<cr>", "[TELESCOPE] Find buffers"},
--         h = {"<cmd>Telescope help_tags<cr>", "[TELESCOPE] Help tags"},
--         m = {"<cmd>Telescope marks<cr>", "[TELESCOPE] Marks"}
--     },

--     -- [[ Gitsigns ]]
--     ["<leader>g"] = {
--         name = "[GITSIGNS]",
--         s = {"<cmd>Gitsigns toggle_signs<cr>", "[GITSIGNS] Toggle signs"},
--         h = {"<cmd>Gitsigns preview_hunk<cr>", "[GITSIGNS] Preview hunk"},
--         d = {"<cmd>Gitsigns diffthis<cr>", "[GITSIGNS] Show diff"}
--     },

--     -- [[LspSaga]]
--     ["<leader>l"] = {
--         name = "[LSP]",
--         n = {"<cmd>Lspsaga diagnostic_jump_next<cr>", "[SAGA] Diagnostic jump next"},
--         p = {"<cmd>Lspsaga diagnostic_jump_prev<cr>", "[SAGA] Diagnostic jump previous"},
--         d = {"<cmd>Lspsaga preview_definition<cr>", "[SAGA] Preview definition"},
--         x = {"<cmd>Lspsaga lsp_finder<cr>", "[SAGA] LSP Finder"},
--         c = {"<cmd>Lspsaga code_action<cr>", "[SAGA] Code Action"},
--         r = {"<cmd>Lspsaga rename<cr>", "[SAGA] Rename"}
--     }
-- }, opts)

wk.setup({})
