local ok, install = pcall(require, 'dap-install')
if not ok then
    return
end
install.setup({
    installation_path = vim.fn.stdpath('data') .. '/dapinstall/',
    verbosely_call_debuggers = false
})
