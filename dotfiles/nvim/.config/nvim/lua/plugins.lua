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

    'lyuts/vim-rtags',
    'christoomey/vim-tmux-navigator',
    'vim-airline/vim-airline',
    'editorconfig/editorconfig-vim',
    'lfv89/vim-interestingwords',

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'hrsh7th/cmp-buffer'},   -- Optional - ldonoso
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    },

}
