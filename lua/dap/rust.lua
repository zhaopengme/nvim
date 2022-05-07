local M = {}

function M.setup(dap)

    dap.adapters.codelldb = function(on_adapter)
        local stdout = vim.loop.new_pipe(false)
        local stderr = vim.loop.new_pipe(false)

        local cmd = vim.fn.stdpath("data") .. "/dapinstall/codelldb/extension/adapter/codelldb"
        local handle, pid_or_err
        local opts = {
            stdio = {nil, stdout, stderr},
            detached = true
        }
        handle, pid_or_err = vim.loop.spawn(cmd, opts, function(code)
            stdout:close()
            stderr:close()
            handle:close()
            if code ~= 0 then
                print("codelldb exited with code", code)
            end
        end)
        assert(handle, "Error running codelldb: " .. tostring(pid_or_err))
        stdout:read_start(function(err, chunk)
            assert(not err, err)
            if chunk then
                local port = chunk:match('Listening on port (%d+)')
                if port then
                    vim.schedule(function()
                        on_adapter({
                            type = 'server',
                            host = '127.0.0.1',
                            port = port
                        })
                    end)
                else
                    vim.schedule(function()
                        require("dap.repl").append(chunk)
                    end)
                end
            end
        end)
        stderr:read_start(function(err, chunk)
            assert(not err, err)
            if chunk then
                vim.schedule(function()
                    require("dap.repl").append(chunk)
                end)
            end
        end)
    end

    dap.configurations.rust = {{
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            vim.notify("Compiling a debug build for debugging. This might take some time...")
            local r = io.popen("cargo run --quiet")
            r:read("*a")
            r:close()
            -- local cwd = lspconfig.util.find_git_ancestor(vim.fn.getcwd())
            local cwd = vim.fn.getcwd()
            local handle = io.popen("stoml " .. cwd .. "/Cargo.toml package.name")
            local name = handle:read("*l")
            handle:close()
            return cwd .. "/target/debug/" .. name
        end,
        -- cargo = {
        --     args = {"build", "--message-format=json"}
        -- },
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        terminal = 'integrated',
        args = {}
        -- sourceLanguages = {'rust'}
    }}
end

return M
