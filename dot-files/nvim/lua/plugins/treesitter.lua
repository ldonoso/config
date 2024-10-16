return {
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate', -- <cmd> not supported!
        config = function()
            require('nvim-treesitter.configs').setup({
                -- A list of parser names, or "all"
                ensure_installed = { "vimdoc", "lua", "cpp", "c", "sql", "markdown", "markdown_inline", "haskell", "commonlisp", "nix", },

                highlight = {
                    enable = true,

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },

                indent = { enable = true },
            })

            -- folding using treesitter
            vim.opt.foldmethod = 'expr'
            vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        end,
    },

    -- 'nvim-treesitter/nvim-treesitter-context',
}
