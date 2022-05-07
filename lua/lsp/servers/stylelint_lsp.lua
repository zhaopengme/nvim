local M = {}
M.setup = function(on_attach, capabilities)
    local lspconfig = require "lspconfig"

    lspconfig.stylelint_lsp.setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150
        },
        capabilities = capabilities
    }
end

return M
