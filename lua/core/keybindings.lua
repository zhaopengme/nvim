vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", {
    noremap = true,
    silent = true
})

vim.api.nvim_set_keymap("i", "jk", "<ESC>", {
    noremap = true
})
vim.api.nvim_set_keymap("i", "kj", "<ESC>", {
    noremap = true
})

vim.api.nvim_set_keymap("n", "<M-j>", ":resize -2<CR>", {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap("n", "<M-k>", ":resize +2<CR>", {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap("n", "<M-h>", ":vertical resize -2<CR>", {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap("n", "<M-l>", ":vertical resize +2<CR>", {
    noremap = true,
    silent = true
})

vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {
    noremap = true,
    silent = false
})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {
    noremap = true,
    silent = false
})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {
    noremap = true,
    silent = false
})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {
    noremap = true,
    silent = false
})

vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<CR>", {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprevious<CR>", {
    noremap = true,
    silent = true
})

vim.api.nvim_set_keymap("v", "<", "<gv", {
    noremap = true,
    silent = false
})
vim.api.nvim_set_keymap("v", ">", ">gv", {
    noremap = true,
    silent = false
})

vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", {
    noremap = true,
    silent = true
})

if Modx.plugins.nvim_comment.enabled then
    vim.api.nvim_set_keymap("v", "<leader>/", ":CommentToggle<cr>", {
        noremap = true,
        silent = true
    })
end

vim.cmd('inoremap <expr> <c-j> ("\\<C-n>")')
vim.cmd('inoremap <expr> <c-k> ("\\<C-p>")')
vim.cmd("vnoremap // y/\\V<C-R>=escape(@\",'/')<CR><CR>")
vim.api.nvim_set_keymap("t", "jk", "<c-\\><c-n>", {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap("v", "q", ":quit", {
    noremap = true,
    silent = true
})

vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', {
    noremap = true,
    silent = true
})
