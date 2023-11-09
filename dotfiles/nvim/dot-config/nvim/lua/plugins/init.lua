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
        init = function()
            vim.g.tmux_navigator_disable_when_zoomed = 1
        end,
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

    'editorconfig/editorconfig-vim',
    'lfv89/vim-interestingwords',

}
