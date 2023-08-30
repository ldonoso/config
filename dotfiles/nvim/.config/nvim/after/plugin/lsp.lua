-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#recommended
local lsp = require('lsp-zero').preset("recommended")

lsp.ensure_installed({
  'clangd',
})

lsp.on_attach(function(client, bufnr)
  local opts = { noremap = true, silent = true }

  -- see :help lsp-zero-keybindings to learn the available actions
  lsp.default_keymaps(opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh', '<Cmd>ClangdSwitchSourceHeader<CR>', opts)
end)

lsp.setup()

-- Make sure you setup `cmp` after lsp-zero
local cmp = require('cmp')

cmp.setup({
  -- Invoke completion menu manually
  completion = {
    autocomplete = false
  },

  -- Use Enter to confirm completion
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-Space>'] = cmp.mapping.complete(),
  },
})
