local set = vim.keymap.set
local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

local lsp_attach = function(args)
  local bufnr = args.buf
  local client = vim.lsp.get_client_by_id(args.data.client_id)

  local opts = { noremap = true, buffer = bufnr }

  -- some of the keymaps overwrite build-in keymaps
  set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

  if client.supports_method("textDocument/formatting") then
    set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)

    -- format on safe
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end
end

return {
  {
    'neovim/nvim-lspconfig', -- "data only" repo, providing basic, default Nvim LSP client configs
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',           -- install and manage LSP servers
      'williamboman/mason-lspconfig.nvim', -- bridges mason.nvim and lspconfig
      'j-hui/fidget.nvim',                 -- Useful status updates for LSP
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = lsp_attach,
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require('lspconfig')

      require("fidget").setup({})
      require("mason").setup()
      require('mason-lspconfig').setup({
        ensure_installed = { 'clangd', 'lua_ls', },
        handlers = {
          -- this first fun is the default. Applies to every LS without a custom handler
          function(server)
            lspconfig[server].setup({
              capabilities = capabilities, -- Advertise completion to LSP servers
            })
          end,

          ["clangd"] = function()
            lspconfig.clangd.setup {
              capabilities = capabilities,
              on_attach = function(client, bufnr)
                local opts = { noremap = true, silent = true, buffer = bufnr }
                set('n', 'gh', '<cmd>ClangdSwitchSourceHeader<cr>', opts)
                -- set("x", "<leader>lA", "<cmd>ClangdAST<cr>", opts)
                -- set("n", "<leader>lH", "<cmd>ClangdTypeHierarchy<cr>", opts)
                -- set("n", "<leader>lt", "<cmd>ClangdSymbolInfo<cr>", opts)
                -- set("n", "<leader>lm", "<cmd>ClangdMemoryUsage<cr>", opts)
                --
                -- require("clangd_extensions.inlay_hints").setup_autocmd()
                -- require("clangd_extensions.inlay_hints").set_inlay_hints()
              end,
            }
          end,

          ["lua_ls"] = function()
            lspconfig.lua_ls.setup {
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                  }
                }
              }
            }
          end,
        },
      })
    end
  },
}
