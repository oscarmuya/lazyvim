return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup{
        check_ts = true,
        enable_check_bracket_line = false,
        disable_filetype = { "TelescopePrompt", "vim", "txt" },
      }

      -- optional nvim-cmp integration
      local ok, cmp = pcall(require, "cmp")
      if ok then
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "htmldjango", "xml", "javascriptreact", "typescriptreact" },
  },
}

