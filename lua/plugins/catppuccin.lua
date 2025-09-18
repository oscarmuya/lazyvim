return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            transparent_background = true,
            integrations = {
                nvimtree = true,
                telescope = true,
                mason = true
            }
        })
        vim.cmd("colorscheme catppuccin")

    end
}
