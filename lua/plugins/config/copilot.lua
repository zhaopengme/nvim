-- Copilot
vim.b.copilot_enabled = false
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

vim.api.nvim_set_keymap("i", "<right>", 'copilot#Accept("")', {
    expr = true,
    silent = true
})
