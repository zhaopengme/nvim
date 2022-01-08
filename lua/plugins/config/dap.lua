local dap = require('dap')
require('plugins.config.dap.dapui')

local dap_languages = Modx.dap_languages
for _, language in pairs(dap_languages) do

    local dap_config = vim.fn.stdpath "config" .. '/lua/plugins/config/dap/' .. language .. '.lua'
    if Modx.utils.file.exists(dap_config) then
        require('plugins.config.dap.' .. language).setup(dap)
    end
end

-- jdtls special operation
vim.api.nvim_exec([[
    augroup jdtls_lsp
      autocmd!
      autocmd FileType java lua require('plugins.config.dap.jdtls.init').setup()
    augroup end
  ]], false)
