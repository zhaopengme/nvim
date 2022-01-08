local M = {}

function M.setup(opts)
    opts = vim.tbl_deep_extend("force", {
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                    path = vim.split(package.path, ';')
                },
                diagnostics = {
                    globals = {'vim'}
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false
                },
                telemetry = {
                    enable = false
                }
            }
        }
    }, opts)
    return opts
end

return M
