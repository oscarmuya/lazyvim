local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
if cmp_ok and cmp_nvim_lsp and cmp_nvim_lsp.default_capabilities then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

local function make_on_attach()
  return function(client, bufnr)
    local buf_map = function(mode, lhs, rhs, opts)
      opts = opts or { noremap = true, silent = true }
      vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    -- Standard LSP mappings
    buf_map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
    buf_map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
    buf_map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
    buf_map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
    buf_map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
    buf_map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
    buf_map("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>")

    -- TypeScript-tools specific mappings (correct command names)
    buf_map("n", "<leader>oi", "<cmd>TSToolsOrganizeImports<CR>")
    buf_map("n", "<leader>ai", "<cmd>TSToolsAddMissingImports<CR>")
    buf_map("n", "<leader>fu", "<cmd>TSToolsRemoveUnused<CR>")
    buf_map("n", "<leader>fa", "<cmd>TSToolsFixAll<CR>")
    buf_map("n", "<leader>rf", "<cmd>TSToolsRenameFile<CR>")
  end
end

local opts = {
  on_attach = make_on_attach(),
  handlers = {},
  settings = {
    separate_diagnostic_server = true,
    publish_diagnostic_on = "insert_leave",
    expose_as_code_action = {
      "fix_all",
      "add_missing_imports",
      "remove_unused",
      "remove_unused_imports",
      "organize_imports",
    },
    tsserver_path = nil,
    tsserver_plugins = {},
    tsserver_max_memory = "auto",
    tsserver_format_options = { tabSize = 2, indentSize = 2, convertTabsToSpaces = true },
    tsserver_file_preferences = {
      quotePreference = "single",
      importModuleSpecifierPreference = "relative",
      includePackageJsonAutoImports = "auto",
    },
    tsserver_locale = "en",
    include_completions_with_insert_text = true,
    complete_function_calls = true,
    code_lens = "off",
    disable_member_code_lens = true,
    jsx_close_tag = { enable = false, filetypes = { "javascriptreact", "typescriptreact" } },
  },
}

return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  config = function()
    require("typescript-tools").setup(opts)
  end,
}
