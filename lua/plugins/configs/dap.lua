local ok, dap = pcall(require, "dap")
if not ok then
	return
end

require("plugins.configs.dapui")

local dap_languages = { "rust", "node2", "go", "java" }
for _, language in pairs(dap_languages) do
	-- local dap_config = vim.fn.stdpath "config" .. '/lua/dap/' .. language .. '.lua'
	require("dap." .. language).setup(dap)
end

-- -- jdtls special operation
-- vim.api.nvim_exec([[
--     augroup jdtls_lsp
--       autocmd!
--       autocmd FileType java lua require('plugins.config.dap.jdtls.init').setup()
--     augroup end
--   ]], false)
