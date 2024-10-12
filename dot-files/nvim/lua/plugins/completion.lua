return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        {
            { 'hrsh7th/cmp-nvim-lsp' },
            'L3MON4D3/LuaSnip', -- snippet engine
            build = 'make install_jsregexp',
            { -- N.B. If defined as a dependency of LuaSnip, Lazy vim thinks it is not installed
                'rafamadriz/friendly-snippets',
                config = function()
                    require('luasnip.loaders.from_vscode').lazy_load() -- add snippets to luasnip
                end,
            },
        },
        'saadparwaiz1/cmp_luasnip', -- luasnip completion source - makes LuaSnip work with nvim-cmp
        'hrsh7th/cmp-buffer',
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require 'luasnip'
        luasnip.config.setup {}

        cmp.setup({
            vindow = {
                documentation = cmp.config.window.bordered()
            },

            -- enable luasnip to handle snippet expansion for nvim-cmp
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },

            -- the order matters
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer',  keyword_length = 5 },
            },

            completion = {
                autocomplete = false -- when false, trigger completion menu manually
            },

            mapping = cmp.mapping.preset.insert({
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-p>'] = cmp.mapping.select_prev_item(),

                -- Scroll the documentation window
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),

                -- Accept ([y]es) the completion.
                --  This will auto-import if your LSP supports it.
                --  This will expand snippets if the LSP sent a snippet.
                ['<C-y>'] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert, -- insert and move adjacent text to the right
                    select = true,                         -- If no selection, select the first item
                }),

                -- Manually trigger a completion from nvim-cmp.
                --  Generally you don't need this, because nvim-cmp will display
                --  completions whenever it has completion options available.
                ['<C-Space>'] = cmp.mapping.complete(),

                -- jump to next placeholder in the snippet
                ['<C-l>'] = cmp.mapping(function()
                    if luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    end
                end, { 'i', 's' }),

                ['<C-h>'] = cmp.mapping(function()
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    end
                end, { 'i', 's' }),
            }),
        })
    end
}
