local M = {}

function M.setup(dap)

    dap.adapters.node2 = {
        type = 'executable',
        command = 'node',
        args = {vim.fn.stdpath("data") .. "/dapinstall/jsnode/vscode-node-debug2/out/src/nodeDebug.js"}
    }

    dap.configurations.javascript = {{
        type = 'node2',
        request = 'launch',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal'
    }}

    dap.configurations.typescript = dap.configurations.javascript
end

return M
