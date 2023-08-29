local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
  'clangd',
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  -- see :help lsp-zero-keybindings to learn the available actions
  lsp.default_keymaps({buffer = bufnr})

  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)

end)

-- Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
