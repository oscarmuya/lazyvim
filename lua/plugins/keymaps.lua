-- telescope
vim.keymap.set("n", "<leader>fs", ":Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fp", ":Telescope git_files<cr>")
vim.keymap.set("n", "<leader>fz", ":Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<cr>")

-- tree
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<cr>")
vim.keymap.set("n", "<leader>b", "<C-w>w", { desc = "Back to editor" })

-- format code using LSP
vim.keymap.set("n", "<leader>fmd", vim.lsp.buf.format)

-- markdown preview
vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<cr>")

-- nvim-comment
vim.keymap.set({"n", "v"}, "<leader>/", ":CommentToggle<cr>")

--- lsp saga
vim.keymap.set('n', '<leader>ld', '<cmd>Lspsaga show_line_diagnostics<CR>', { desc = "Show line diagnostics" })
vim.keymap.set('n', '<leader>la', '<cmd>Lspsaga code_action<CR>', { desc = "Code action" })

vim.keymap.set('n', '<leader>ln', '<cmd>Lspsaga diagnostic_jump_next<CR>', { desc = "Next diagnostic" })
vim.keymap.set('n', '<leader>lp', '<cmd>Lspsaga diagnostic_jump_prev<CR>', { desc = "Previous diagnostic" })
