local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then return end
capabilities.textDocument.completion.completionItem.snippetSupport = false
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local status, jdtls = pcall(require, "jdtls")
if not status then return end

-- Determine OS
local home = os.getenv("HOME")
local CONFIG_PATH
local LOMBOK_JAR_PATH
local JDTLS_JAR_GLOB_PATH
local JDT_CONFIG
if vim.fn.has("mac") == 1 then
    WORKSPACE_PATH = home .. "/workspace/"
    CONFIG = "mac"
    CONFIG_PATH = home .. "/.local/share/nvim/"
    LOMBOK_JAR_PATH = home ..
                          "/.local/share/nvim/mason/packages/jdtls/lombok.jar"
    JDTLS_JAR_GLOB_PATH = home ..
                              "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
    JDT_CONFIG = home .. "/.local/share/nvim/mason/packages/jdtls/config_" ..
                     CONFIG
elseif vim.fn.has("unix") == 1 then
    WORKSPACE_PATH = home .. "/workspace/"
    CONFIG = "linux"
    CONFIG_PATH = home .. "/.local/share/nvim/"
    LOMBOK_JAR_PATH = home ..
                          "/.local/share/nvim/mason/packages/jdtls/lombok.jar"
    JDTLS_JAR_GLOB_PATH = home ..
                              "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
    JDT_CONFIG = home .. "/.local/share/nvim/mason/packages/jdtls/config_" ..
                     CONFIG
elseif vim.fn.has("windows") == 1 then
    WORKSPACE_PATH = home .. "/workspace/"
    CONFIG = "win"
    CONFIG_PATH = home .. "/AppData/Local/nvim-data/"
    LOMBOK_JAR_PATH = home ..
                          "/AppData/Local/nvim-data/mason/packages/jdtls/lombok.jar"
    JDTLS_JAR_GLOB_PATH = home ..
                              "/AppData/Local/nvim-data/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
    JDT_CONFIG =
        home .. "/AppData/Local/nvim-data/mason/packages/jdtls/config_" ..
            CONFIG
else
    print("Unsupported system")
end

-- Find root of project
local root_markers = {".git", "mvnw", "gradlew", "pom.xml", "build.gradle"}
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then return end

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local workspace_dir = WORKSPACE_PATH .. project_name

-- TODO: Testing

JAVA_DAP_ACTIVE = false

local bundles = {}

if JAVA_DAP_ACTIVE then
    vim.list_extend(bundles, vim.split(
                        vim.fn
                            .glob(CONFIG_PATH .. "vscode-java-test/server/*.jar"),
                        "\n"))
    vim.list_extend(bundles, vim.split(vim.fn.glob(CONFIG_PATH ..
                                                       "java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"),
                                       "\n"))
end

local config = {
    cmd = {
        "java", "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true", "-Dlog.level=ALL",
        "-javaagent:" .. LOMBOK_JAR_PATH, "-Xms1g", "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED", "--add-opens",
        "java.base/java.lang=ALL-UNNAMED", "-jar",
        vim.fn.glob(JDTLS_JAR_GLOB_PATH), "-configuration", JDT_CONFIG, "-data",
        workspace_dir
    },
    root_dir = root_dir,
    settings = {
        java = {
            -- jdt = {
            --   ls = {
            --     vmargs = "-XX:+UseParallelGC -XX:GCTimeRatio=4 -XX:AdaptiveSizePolicyWeight=90 -Dsun.zip.disableMemoryMapping=true -Xmx1G -Xms100m"
            --   }
            -- },
            eclipse = {downloadSources = true},
            configuration = {updateBuildConfiguration = "interactive"},
            maven = {downloadSources = true},
            implementationsCodeLens = {enabled = true},
            referencesCodeLens = {enabled = true},
            references = {includeDecompiledSources = true},
            inlayHints = {
                parameterNames = {
                    enabled = "all" -- literals, all, none
                }
            },
            format = {
                enabled = false
                -- settings = {
                --   profile = "asdf"
                -- }
            }
        },
        signatureHelp = {enabled = true},
        completion = {
            favoriteStaticMembers = {
                "org.hamcrest.MatcherAssert.assertThat",
                "org.hamcrest.Matchers.*", "org.hamcrest.CoreMatchers.*",
                "org.junit.jupiter.api.Assertions.*",
                "java.util.Objects.requireNonNull",
                "java.util.Objects.requireNonNullElse", "org.mockito.Mockito.*"
            }
        },
        contentProvider = {preferred = "fernflower"},
        extendedClientCapabilities = extendedClientCapabilities,
        sources = {
            organizeImports = {starThreshold = 9999, staticStarThreshold = 9999}
        },
        codeGeneration = {
            toString = {
                template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
            },
            useBlocks = true
        }
    },

    flags = {allow_incremental_sync = true},
    init_options = {
        bundles = {
            -- vim.fn.glob("/Users/zhaopeng/Dev/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar")
        }
    },
    on_attach = function(client, bufnr)
        -- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
        -- you make during a debug session immediately.
        -- Remove the option if you do not want that.
        -- You can use the `JdtHotcodeReplace` command to trigger it manually
        -- require('jdtls').setup_dap({hotcodereplace = 'auto'})
        -- require('jdtls.dap').setup_dap_main_class_configs()

        require("jdtls").setup_dap({hotcodereplace = "auto"})
        require("jdtls.dap").setup_dap_main_class_configs()
        client.server_capabilities.document_formatting = false
        vim.lsp.codelens.refresh()
    end,
    capabilities = capabilities
}

require("jdtls").start_or_attach(config)
require("jdtls.setup").add_commands()
--
-- vim.keymap.set('n', '<leader>o',
--                '<Cmd>lua require\'jdtls\'.organize_imports()<CR>')
-- -- vim.keymap.set('n', '<leader>f', '<Cmd>lua vim.lsp.buf.format {async = true}<CR>')
-- vim.keymap.set('n', 'crv', '<Cmd>lua require(\'jdtls\').extract_variable()<CR>')
-- vim.keymap.set('v', 'crv',
--                '<Esc><Cmd>lua require(\'jdtls\').extract_variable(true)<CR>')
-- vim.keymap.set('n', 'crc', '<Cmd>require(\'jdtls\').extract_constant()<CR>')
-- vim.keymap.set('v', 'crc',
--                '<Esc><Cmd>lua require(\'jdtls\').extract_constant(true)<CR>')
-- vim.keymap.set('v', 'crm',
--                '<Esc><Cmd>lua require(\'jdtls\').extract_method(true)<CR>')
-- vim.keymap.set('n', '<F5>', '<Cmd>lua require\'dap\'.continue()<CR>')
