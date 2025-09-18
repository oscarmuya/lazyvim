return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {{'L3MON4D3/LuaSnip'}},
  config = function()
    local lsp_zero = require('lsp-zero')
    lsp_zero.extend_cmp()


    local cmp = require('cmp')
    local cmp_action = lsp_zero.cmp_action()


    cmp.setup({
      formatting = lsp_zero.cmp_format({ details = true }),
      mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        --  Tab to cycle completions/snippets
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif require('luasnip').expand_or_jumpable() then
            require('luasnip').expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),

        --  Shift-Tab to go backwards
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif require('luasnip').jumpable(-1) then
            require('luasnip').jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),

        --  Enter confirms the current item
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
    })

  end,
}
