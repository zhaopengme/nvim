local M = {}

function M.setup(opts)
    opts = vim.tbl_deep_extend("force", {
        settings = {
            json = {
                schemas = Modx.utils.plugins.require('schemastore').json.schemas()
            }
        }
    }, opts)
    return opts
end

return M
