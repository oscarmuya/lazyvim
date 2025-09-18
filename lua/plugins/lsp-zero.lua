return {
'VonHeikemen/lsp-zero.nvim',
branch = 'v3.x',
lazy = true,
config = false,
init = function()
-- Disable automatic setup; we'll configure manually elsewhere
vim.g.lsp_zero_extend_cmp = 0
vim.g.lsp_zero_extend_lspconfig = 0
end,
}
