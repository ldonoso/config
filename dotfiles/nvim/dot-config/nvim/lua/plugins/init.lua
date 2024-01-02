return {
    -- the colorscheme should be available when starting Neovim
    {
        'morhetz/gruvbox',
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            vim.g.gruvbox_italic = 0
            -- load the colorscheme here
            vim.cmd([[colorscheme gruvbox]])
        end,
    },

    'ctrlpvim/ctrlp.vim',
    'godlygeek/tabular',
    'ivanov/vim-ipython',

    {
        'preservim/tagbar',  -- requires universal ctags
        -- autocmd FileType tagbar setlocal nocursorline nocursorcolumn  " for tagbar slowness
        config = function()
            vim.g.tagbar_iconchars = {'', '▼' }
        end,
    },

    'mileszs/ack.vim',
    'nelstrom/vim-visual-star-search',
    'tpope/vim-dispatch',

    'idanarye/vim-merginal',
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',  -- GBrowse github
    'tommcdo/vim-fubitive',  -- GBrowse bitbucket
    'junegunn/gv.vim',

    'tpope/vim-repeat',
    'tpope/vim-surround',
    'tpope/vim-unimpaired',
    'tpope/vim-vinegar',
    'tpope/vim-sleuth',
    'will133/vim-dirdiff',
    'AndrewRadev/linediff.vim',

    --{
    --    'davidhalter/jedi-vim',
    --    ft = 'python'
    --},

    {
        'christoomey/vim-tmux-navigator',

        -- init is called during startup. Configuration for vim plugins typically should be set in an init function
        init = function()
            vim.g.tmux_navigator_disable_when_zoomed = 1
        end,

        -- Lazy-load on command
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },

        -- Lazy-load on key bindings
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', },
        config = function()
            require('lualine').setup({
             -- sections = { lualine_c = {'filename', 'nvim_treesitter#statusline', }, },
            })
        end,
    },

    {
        'editorconfig/editorconfig-vim',
        init = function()
            -- To ensure that this plugin works well with Tim Pope's fugitive
            vim.g.EditorConfig_exclude_patterns = {'fugitive://.*', }
        end,
    },

    'lfv89/vim-interestingwords',

}
