-- lsp-zero
-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#recommended
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr, noremap = true, silent = true })

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh', '<Cmd>ClangdSwitchSourceHeader<CR>', { noremap = true, silent = true })
end)

-- mason
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'clangd', },
  handlers = {
    lsp_zero.default_setup,
  },
})

-- cmp config. Make sure you setup `cmp` after lsp-zero
local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'buffer'},
  },

  completion = {
    autocomplete = false  -- Invoke completion menu manually
  },

  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = false }),  -- `Enter` key to confirm completion
    ['<C-Space>'] = cmp.mapping.complete(),  -- Ctrl+space to trigger completion menu
  }),

  --- (Optional) Show source name in completion menu
  formatting = require('lsp-zero').cmp_format()
})
