return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',

    dependencies = {
        'nvim-lua/plenary.nvim',
        "nvim-tree/nvim-web-devicons",
        {
            'nvim-telescope/telescope-fzf-native.nvim', -- support fzf syntax
            -- `build` is used to run some command when the plugin is installed/updated.
            build = 'make',
            -- `cond` is a condition used to determine whether this plugin should be installed and loaded.
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
        {
            "nvim-telescope/telescope-live-grep-args.nvim",
            -- This will not install any breaking changes. For major updates, this must be adjusted manually.
            version = "^1.0.0",
        },
    },

    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')
        local lga_actions = require('telescope-live-grep-args.actions')

        telescope.setup {
            defaults = {
                path_display = { "smart" },
            },
            pickers = {
                find_files = {
                    mappings = {
                        i = {
                        },
                    },
                },
            },
            extensions = {
                -- makes grep_string unnecessary
                live_grep_args = {
                    auto_quoting = true, -- enable/disable auto-quoting
                    mappings = {
                        i = {
                            ['<C-k>'] = lga_actions.quote_prompt(),
                            ['<C-i>'] = lga_actions.quote_prompt({ postfix = ' --iglob ' }),
                            ['<C-space>'] = actions.to_fuzzy_refine, -- start a fuzzy search in the current list
                        },
                    },
                    -- ... also accepts theme settings, for example:
                    -- theme = "dropdown", -- use dropdown theme
                    -- theme = { }, -- use own theme spec
                    -- layout_config = { mirror=true }, -- mirror preview pane
                }
            },
        }

        local builtin = require('telescope.builtin')
        local opts = { noremap = true, silent = true }
        local lga_shortcuts = require('telescope-live-grep-args.shortcuts')

        -- https://www.reddit.com/r/neovim/comments/sjiwox/question_give_arguments_to_vimkeymapsets_function/
        local wrap = function(func, ...)
            local args = { ... }
            return function() func(unpack(args)) end
        end

        vim.keymap.set('n', '<C-p>',
            wrap(builtin.find_files, { layout_strategy = 'current_buffer', hidden = true, no_ignore = true, }), opts)
        vim.keymap.set('v', '<C-p>',
            wrap(builtin.find_files,
                {
                    layout_strategy = 'current_buffer',
                    hidden = true,
                    no_ignore = true,
                    search_file = vim.fn.expand('<cword>'),
                }), opts) -- TODO: not correct!

        vim.keymap.set('n', '<leader>fg',
            wrap(telescope.extensions.live_grep_args.live_grep_args, { layout_strategy = 'current_buffer', }), opts)
        vim.keymap.set('v', '<leader>fg',
            wrap(lga_shortcuts.grep_visual_selection, { layout_strategy = 'current_buffer', }), opts)

        vim.keymap.set('n', '<leader>fs',
            wrap(builtin.lsp_dynamic_workspace_symbols, { layout_strategy = 'current_buffer', }), opts)

        pcall(telescope.load_extension('fzf')) -- pcall so errors do not propagate
        pcall(telescope.load_extension('live_grep_args'))
    end,
}
