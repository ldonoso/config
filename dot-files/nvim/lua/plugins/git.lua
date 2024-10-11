return {
    { 'idanarye/vim-merginal', enable = false, },

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
}
