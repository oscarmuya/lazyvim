return {
  'neovim/nvim-lspconfig',
  cmd = {'LspInfo', 'LspInstall', 'LspStart'},
  event = {'BufReadPre', 'BufNewFile'},
  dependencies = {{'hrsh7th/cmp-nvim-lsp'}, {'williamboman/mason-lspconfig.nvim'}},
  config = function()
    local lsp_zero = require('lsp-zero')
    lsp_zero.extend_lspconfig()


    lsp_zero.on_attach(function(client, bufnr)
      lsp_zero.default_keymaps({ buffer = bufnr })
    end)

    require('mason-lspconfig').setup({
      ensure_installed = {
        'pyright', -- python
        "tailwindcss"
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
        -- Add a specific handler for tailwindcss
        tailwindcss = function()
          local lspconfig = require('lspconfig')
          lspconfig.tailwindcss.setup {
            -- You can add specific settings here if needed in the future
          }
        end,

        -- default handler for other servers
        lsp_zero.default_setup,

        lua_ls = function()
          local lua_opts = lsp_zero.nvim_lua_ls()
          require('lspconfig').lua_ls.setup(lua_opts)
        end,
      },
    })

  end,
}

