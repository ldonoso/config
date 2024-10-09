local ft_parentheses = { "lisp", 'clojure', 'scheme', }

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
            vim.g.gruvbox_italic = 0
            vim.cmd([[colorscheme gruvbox]])
        end,
    },

    {
        'ellisonleao/gruvbox.nvim', -- port of gruvbox community to lua with treesitter and semantic highlights support!
        enabled = false,
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme gruvbox]])
        end,
    },

    {
        'sainnhe/gruvbox-material', -- softer contrast than morhetz's with treesitter and semantic highlights support
        enabled = true,
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme gruvbox-material]])
        end,
    },

    'godlygeek/tabular',
    'ivanov/vim-ipython',

    {
        'preservim/tagbar', -- requires universal ctags
        -- autocmd FileType tagbar setlocal nocursorline nocursorcolumn  " for tagbar slowness
        config = function()
            vim.g.tagbar_iconchars = { '', '▼' }
        end,
    },

    'nelstrom/vim-visual-star-search',
    'tpope/vim-dispatch',

    'idanarye/vim-merginal',

    {
        'tpope/vim-fugitive',
        lazy = false,
        keys = {
            { "<leader>gs", "<cmd>Git<CR><C-w>20_" },
            { "<leader>gd", "<cmd>Gvdiffsplit!<CR>" },
            { "<leader>ge", "<cmd>Gedit<CR>" },
            { "<leader>gb", "<cmd>Git blame -w -C -C -C<CR>" }, -- ignore ws and moved/copied chunks
        },
    },

    'tpope/vim-rhubarb',    -- GBrowse github
    'tommcdo/vim-fubitive', -- GBrowse bitbucket
    'junegunn/gv.vim',

    'tpope/vim-repeat', -- enable repeating supported plugin maps with `.`
    'tpope/vim-surround',
    'tpope/vim-unimpaired',
    'tpope/vim-vinegar',
    'tpope/vim-sleuth',
    'will133/vim-dirdiff',

    {
        'AndrewRadev/linediff.vim',
        lazy = false,
        keys = {
            {
                "<leader>ld",
                "jV<Plug>(unimpaired-context-next)k:Linediff<CR><Plug>(unimpaired-context-next)jV<Plug>(unimpaired-context-next)k:Linediff<CR>",
                mode = "n",
                desc = "line diff between two diff markers",
            },
        },
        config = function()
            vim.g.linediff_first_buffer_command = 'leftabove new'
            vim.g.linediff_further_buffer_command = 'rightbelow vertical new'
        end,
    },

    --{
    --    'davidhalter/jedi-vim',
    --    ft = 'python'
    --},

    {
        'christoomey/vim-tmux-navigator',
        lazy = false,

        -- init is called before the pluging loads, for plugins that depend on variables set before loading
        -- config is called after the plugin is loaded
        config = function()
            vim.g.tmux_navigator_disable_when_zoomed = 1
        end,

        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },

        keys = {
            { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },

            { "<c-h>",  "<c-\\><c-n>:TmuxNavigateLeft<cr>",  mode = "t", silent = true },
            { "<c-j>",  "<c-\\><c-n>:TmuxNavigateDown<cr>",  mode = "t", silent = true },
            { "<c-k>",  "<c-\\><c-n>:TmuxNavigateUp<cr>",    mode = "t", silent = true },
            { "<c-l>",  "<c-\\><c-n>:TmuxNavigateRight<cr>", mode = "t", silent = true },
        },
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', },
        config = function()
            require('lualine').setup({
                -- sections = { lualine_c = {'filename', 'nvim_treesitter#statusline', }, },
            })

            vim.opt.showmode = false -- Don't show the mode, since it's already in the status line
        end,
    },

    {
        'editorconfig/editorconfig-vim',
        config = function()
            -- To ensure that this plugin works well with Tim Pope's fugitive
            vim.g.EditorConfig_exclude_patterns = { 'fugitive://.*', }
        end,
    },

    {
        'lfv89/vim-interestingwords',
        config = function()
            vim.g.interestingWordsGUIColors = { '#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF', }
        end,
    },

    {
        'vlime/vlime',
        ft = { "lisp", },
        config = function(plugin)
            vim.opt.rtp:append(plugin.dir .. "/vim")
        end,
    },

    {
        'kovisoft/paredit',
        ft = ft_parentheses,
    },

    {
        'hiphish/rainbow-delimiters.nvim',
        ft = ft_parentheses,
    },
}
