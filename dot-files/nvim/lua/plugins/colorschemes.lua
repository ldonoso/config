return {
    {
        'morhetz/gruvbox',
        enabled = false,
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            vim.g.gruvbox_italic = 0
            vim.cmd([[colorscheme gruvbox]])
        end,
    },

    {
        'gruvbox-community/gruvbox', -- fork of morhetz's
        enabled = false,
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme gruvbox]])
        end,
    },

    {
        'ellisonleao/gruvbox.nvim', -- port of gruvbox community to lua with treesitter and semantic highlights support!
        enabled = true,
        lazy = false,
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = false,
                    operators = false,
                    folds = false,
                },
            })

            vim.cmd([[colorscheme gruvbox]])
        end,
    },

    {
        'sainnhe/gruvbox-material', -- softer contrast than morhetz's with treesitter and semantic highlights support
        enabled = false,
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme gruvbox-material]])
        end,
    },

    {
        'catppuccin/nvim',
        name = 'catppuccin',
        enabled = false,
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme catppuccin]])
        end,
    },
}
