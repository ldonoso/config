return {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',

    dependencies = {
        'nvim-lua/plenary.nvim',
        "nvim-tree/nvim-web-devicons",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },  -- support fzf syntax
        {
            "nvim-telescope/telescope-live-grep-args.nvim" ,
            -- This will not install any breaking changes. For major updates, this must be adjusted manually.
            version = "^1.0.0",
        },
    },

    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')
        local lga_actions = require('telescope-live-grep-args.actions')

        local function add_no_ignore(opts)
            return {"--no-ignore"}
        end

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
                grep_string = { additional_args = add_no_ignore },
            },
            extensions = {
                live_grep_args = {
                    auto_quoting = true, -- enable/disable auto-quoting
                    mappings = {
                        i = {
                            ['<C-k>'] = lga_actions.quote_prompt(),
                            ['<C-i>'] = lga_actions.quote_prompt({ postfix = ' --iglob ' }),
                            -- freeze the current list and start a fuzzy search in the frozen list
                            ['<C-space>'] = actions.to_fuzzy_refine,
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
        vim.keymap.set('n', '<C-p>', function() builtin.find_files({ no_ignore = true }) end, opts)
        vim.keymap.set('v', '<C-p>', function() builtin.find_files({ no_ignore = true, search_file = vim.fn.expand('<cword>'), }) end, opts) -- TODO: not correct!

        vim.keymap.set('n', '<leader>fg', telescope.extensions.live_grep_args.live_grep_args, opts)
        vim.keymap.set('v', '<leader>fg', lga_shortcuts.grep_visual_selection, opts)

        vim.keymap.set({ 'n', 'v', }, '<leader>fw', builtin.grep_string, opts)
        vim.keymap.set('n', '<leader>fs', builtin.lsp_dynamic_workspace_symbols, opts)

        telescope.load_extension('fzf')
        telescope.load_extension("live_grep_args")

    end,
}
