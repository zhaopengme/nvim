local M = {}

function M.setup()
    local on_attach = function(client, bufnr)
        -- require'jdtls'.setup_dap({hotcodereplace = 'auto'})
        require("jdtls").setup_dap {
            hotcodereplace = "auto"
        }
        require("jdtls.dap").setup_dap_main_class_configs()
        require("jdtls.setup").add_commands()
        -- require('lsp-status').register_progress()
        -- require'lspkind'.init()
        local common = require "plugins.config.dap.jdtls.common"
        common.setup(client, bufnr)
        local opts = common.opts

        -- common.set_keymap(bufnr, "n", "<leader>co", "<Cmd>lua require('jdtls').organize_imports()<CR>", opts)
        -- common.set_keymap(bufnr, "n", "<leader>cv", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
        -- common.set_keymap(bufnr, "v", "<leader>cv", "<Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
        -- common.set_keymap(bufnr, "n", "<leader>ct", "<Cmd>lua require('jdtls').extract_constant()<CR>", opts)
        -- common.set_keymap(bufnr, "v", "<leader>ct", "<Cmd>lua require('jdtls').extract_constant(true)<CR>", opts)
        -- common.set_keymap(bufnr, "v", "<leader>cm", "<Cmd>lua require('jdtls').extract_method(true)<CR>", opts)
        -- -- If using nvim-dap
        -- -- This requires java-debug and vscode-java-test bundles, see install steps in this README further below.
        -- common.set_keymap(bufnr, "n", "<leader>cjt", "<Cmd>lua require('jdtls').test_class()<CR>", opts)
        -- common.set_keymap(bufnr, "n", "<leader>cjn", "<Cmd>lua require('jdtls').test_nearest_method()<CR>", opts)

        vim.cmd [[
         command! -buffer JdtCompile lua require('jdtls').compile()
         command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
         command! -buffer JdtJol lua require('jdtls').jol()
         command! -buffer JdtBytecode lua require('jdtls').javap()
         command! -buffer JdtJshell lua require('jdtls').jshell()
         command! -buffer JdtSetupDapMainClassConfig lua require('jdtls.dap').setup_dap_main_class_configs()
      ]]
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.workspace.configuration = true
    local root_markers = {".git"}
    local root_dir = require("jdtls.setup").find_root(root_markers)
    local home = os.getenv "HOME"
    local workspace_name, _ = string.gsub(vim.fn.fnamemodify(root_dir, ":p"), "/", "_")
    local jdtls_path = vim.fn.stdpath "data" .. "/lsp_servers/jdtls"
    local config_path = home .. "/.config/nvim/lua/plugins/config/dap/jdtls"

    local bundles = {vim.fn.glob(config_path ..
                                     "/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar")}
    vim.list_extend(bundles, vim.split(vim.fn.glob(config_path .. "/vscode-java-test/server/*.jar"), "\n"))
    vim.list_extend(bundles, vim.split(vim.fn.glob(config_path .. "/vscode-java-decompiler/server/*.jar"), "\n"))
    local extendedClientCapabilities = {
        progressReportProvider = true,
        classFileContentsSupport = true,
        resolveAdditionalTextEditsSupport = true
    }

    local config = {
        flags = {
            allow_incremental_sync = true
        },
        capabilities = capabilities,
        on_attach = on_attach,
        name = "jdtls",
        filetypes = {"java"},
        cmd = {config_path .. "/jdtls.sh", jdtls_path .. "/workspace/" .. workspace_name}
    }

    config.settings = require "plugins.config.dap.jdtls.settings"
    config.on_attach = on_attach
    config.on_init = function(client, _)
        client.notify("workspace/didChangeConfiguration", {
            settings = config.settings
        })
    end
    config.init_options = {
        bundles = bundles,
        extendedClientCapabilities = extendedClientCapabilities
    }

    -- Server
    require("jdtls").start_or_attach(config)
end

return M
