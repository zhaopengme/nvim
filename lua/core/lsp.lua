local lsp_installer = Modx.utils.plugins.require('nvim-lsp-installer')

for _, name in pairs(Modx.language_servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found then
        if not server:is_installed() then
            print("Installing " .. name)
            server:install()
        end
    end
end

lsp_installer.on_server_ready(function(server)
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    local opts = {
        capabilities = capabilities
    }

    local lsp_server_config = vim.fn.stdpath "config" .. '/lua/core/lsp/server.name.lua'

    if Modx.utils.file.exists(lsp_server_config) then
        opts = require('core.lsp.' .. server.name).setup(opts)
    end
    if server.name ~= "jdtls" then
        server:setup(opts)
    end
end)

-- Diagnostics

local signs = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " "
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        numhl = ""
    })
end

-- Show icons in autocomplete
require('vim.lsp.protocol').CompletionItemKind = {'', '', 'ƒ', ' ', '', '', '', 'ﰮ', '', '',
                                                  '', '', '了', ' ', '﬌ ', ' ', ' ', '', ' ',
                                                  ' ', ' ', ' ', '', '', '<>'}

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
        spacing = 5,
        severity_limit = 'Warning'
    },
    update_in_insert = true
})
