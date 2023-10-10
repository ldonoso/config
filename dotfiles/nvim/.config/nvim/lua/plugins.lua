return {
    'ctrlpvim/ctrlp.vim',

    'flazz/vim-colorschemes',
    'godlygeek/tabular',
    'idanarye/vim-merginal',
    'ivanov/vim-ipython',
    'majutsushi/tagbar',  -- requires universal ctags
    -- autocmd FileType tagbar setlocal nocursorline nocursorcolumn  " for tagbar slowness

    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },

    'mileszs/ack.vim',
    'nelstrom/vim-visual-star-search',
    'tpope/vim-dispatch',
    'tpope/vim-fugitive',

    'tpope/vim-rhubarb',  -- GBrowse github
    'tommcdo/vim-fubitive',  -- GBrowse bitbucket
    'junegunn/gv.vim',
    'tpope/vim-repeat',
    'tpope/vim-surround',
    'tpope/vim-unimpaired',
    'tpope/vim-vinegar',
    'tpope/vim-sleuth',
    'ujihisa/tabpagecolorscheme',
    'will133/vim-dirdiff',

    'AndrewRadev/linediff.vim',

    {
        'davidhalter/jedi-vim',
        ft = 'python'
    },

    'christoomey/vim-tmux-navigator',
    'vim-airline/vim-airline',
    'editorconfig/editorconfig-vim',
    'lfv89/vim-interestingwords',

    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- LSP support
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
    },

    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-buffer'},  -- Optional
        },
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            {'L3MON4D3/LuaSnip'},
        },
    },

}
