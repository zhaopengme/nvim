local config = {

  cmd = {
  "java",
  "-Declipse.application=org.eclipse.jdt.ls.core.id1",
  "-Dosgi.bundles.defaultStartLevel=4",
  "-Declipse.product=org.eclipse.jdt.ls.core.product",
  "-Dlog.protocol=true",
  "-Dlog.level=ALL",
  "-Xms1g",
  "--add-modules=ALL-SYSTEM",
  "--add-opens",
  "java.base/java.util=ALL-UNNAMED",
  "--add-opens",
  "java.base/java.lang=ALL-UNNAMED",
  "-jar",
  "~/.local/opt/jdtls-launcher/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
  "-configuration",
  "~/.local/opt/jdtls-launcher/jdtls/config_mac",
  "-data",
  "~/.local/opt/jdtls-launcher/jdtls/workspace/folder"
  },
  root_dir = require("jdtls.setup").find_root({".git", "mvnw", "gradlew"}),
  settings = {

  java = {
  }
  },
  init_options = {

  bundles = {
    -- vim.fn.glob("/Users/zhaopeng/Dev/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar")
  };
  }
  }
  config['on_attach'] = function(client, bufnr)
    -- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
    -- you make during a debug session immediately.
    -- Remove the option if you do not want that.
    -- You can use the `JdtHotcodeReplace` command to trigger it manually
    require('jdtls').setup_dap({ hotcodereplace = 'auto' })
    require('jdtls.dap').setup_dap_main_class_configs()
  end

  require("jdtls").start_or_attach(config)
  require("jdtls.setup").add_commands()
  --
  vim.keymap.set('n', '<leader>o', '<Cmd>lua require\'jdtls\'.organize_imports()<CR>')
  -- vim.keymap.set('n', '<leader>f', '<Cmd>lua vim.lsp.buf.format {async = true}<CR>')
  vim.keymap.set('n', 'crv', '<Cmd>lua require(\'jdtls\').extract_variable()<CR>')
  vim.keymap.set('v', 'crv', '<Esc><Cmd>lua require(\'jdtls\').extract_variable(true)<CR>')
  vim.keymap.set('n', 'crc', '<Cmd>require(\'jdtls\').extract_constant()<CR>')
  vim.keymap.set('v', 'crc', '<Esc><Cmd>lua require(\'jdtls\').extract_constant(true)<CR>')
  vim.keymap.set('v', 'crm', '<Esc><Cmd>lua require(\'jdtls\').extract_method(true)<CR>')
  vim.keymap.set('n', '<F5>', '<Cmd>lua require\'dap\'.continue()<CR>')
