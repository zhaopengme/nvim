local ok, install = pcall(require, 'dap-install')
if not ok then
    return
end
install.setup({
    installation_path = vim.fn.stdpath('data') .. '/dapinstall/',
    verbosely_call_debuggers = false
})
-- local dbg_list = require('dap-install.core.debuggers_list').debuggers

-- local dbg_list = Modx.debuggers_list
-- for _, debugger in pairs(dbg_list) do
--     print("Installing debugger " .. debugger)
--     install.config(debugger, {})
-- end
