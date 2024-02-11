return {
    -- the colorscheme should be available when starting Neovim
    {
        'morhetz/gruvbox',
        lazy = false,  -- make sure we load this during startup if it is your main colorscheme
        priority = 1000,  -- make sure to load this before all the other start plugins
        config = function()
            vim.g.gruvbox_italic = 0
            vim.cmd([[colorscheme gruvbox]])
        end,
    },

    {
        'ctrlpvim/ctrlp.vim',
        lazy = false,
        keys = {
            { "<leader>s", [[y:Ack! -Q -i '<C-R>"'<CR>]], "v", desc = "Search selected text" },
        },
        config = function()
            vim.g.ctrlp_working_path_mode = 0
            vim.g.ctrlp_switch_buffer = 'et'

            if vim.fn.executable('ag') == 1 then
                -- Use ag in CtrlP for listing files
                vim.g.ctrlp_user_command = 'ag --literal --files-with-matches --nocolor --hidden -g "" %s'
            end
        end,

    },

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

    {
        'tpope/vim-fugitive',
        lazy = false,
        keys = {
            { "<leader>gs", ":Git<CR><C-w>20_" },
            { "<leader>gd", ":Gdiff!<CR>" },
            { "<leader>ge", ":Gedit<CR>" },
            { "<leader>gb", ":Git blame<CR>" },
        },
    },

    'tpope/vim-rhubarb',  -- GBrowse github
    'tommcdo/vim-fubitive',  -- GBrowse bitbucket
    'junegunn/gv.vim',

    'tpope/vim-repeat',
    'tpope/vim-surround',
    'tpope/vim-unimpaired',
    'tpope/vim-vinegar',
    'tpope/vim-sleuth',
    'will133/vim-dirdiff',

    {
        'AndrewRadev/linediff.vim',
        lazy = false,
        keys = {
            { "<leader>ld", "jV]nk:Linediff<CR>]njV]nk:Linediff<CR>", desc =  "line diff between two diff markers"},
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

        -- init is called during startup before the pluging loads.
        -- Configuration for vim plugins that depend on variables set before loading,
        -- typically should be set in an init function
        init = function()
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
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },

            { "<c-h>", "<c-\\><c-n>:TmuxNavigateLeft<cr>", "t", silent = true },
            { "<c-j>", "<c-\\><c-n>:TmuxNavigateDown<cr>", "t", silent = true },
            { "<c-k>", "<c-\\><c-n>:TmuxNavigateUp<cr>", "t", silent = true },
            { "<c-l>", "<c-\\><c-n>:TmuxNavigateRight<cr>", "t", silent = true },
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
