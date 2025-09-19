return {
  'neovim/nvim-lspconfig',
  cmd = {'LspInfo', 'LspInstall', 'LspStart'},
  event = {'BufReadPre', 'BufNewFile'},
  dependencies = {
    {'hrsh7th/cmp-nvim-lsp'},
    {'williamboman/mason-lspconfig.nvim'},
    {
      'nvimdev/lspsaga.nvim',
      event = 'LspAttach',     -- Better lazy loading
      config = function()
        require('lspsaga').setup({
          -- Modern lspsaga config is much simpler
        })

        -- Updated keymaps with current commands
        local map = vim.keymap.set
        map('n', 'K', '<cmd>Lspsaga hover_doc<CR>', { silent = true, desc = "LSP Hover" })
        map('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', { desc = "Peek definition" })
        map('n', 'gD', '<cmd>Lspsaga goto_definition<CR>', { desc = "Goto definition" })
      end,
      dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons'     -- optional
      }
    },
  },
  config = function()
    -- Rest of your LSP configuration remains the same
    local lsp_zero = require('lsp-zero')
    lsp_zero.extend_lspconfig()

    vim.diagnostic.config({
      virtual_text = false,
      signs = true,
      underline = true,
      update_in_insert = false,
    })

    lsp_zero.on_attach(function(client, bufnr)
      lsp_zero.default_keymaps({ buffer = bufnr })
    end)

    require('mason-lspconfig').setup({
      ensure_installed = {
        'pyright',
        'tailwindcss'
      },
      handlers = {
        pyright = function()
          local lspconfig = require('lspconfig')
          local util = require('lspconfig/util')
          lspconfig.pyright.setup {
            before_init = function(_, config)
              local venv = os.getenv("VIRTUAL_ENV")
              if venv then
                config.settings.python = {
                  pythonPath = util.path.join(venv, "bin", "python")
                }
              end
            end,
          }
        end,
        tailwindcss = function()
          require('lspconfig').tailwindcss.setup {}
        end,
        lsp_zero.default_setup,
        lua_ls = function()
          local lua_opts = lsp_zero.nvim_lua_ls()
          require('lspconfig').lua_ls.setup(lua_opts)
        end,
      },
    })
  end,
}
