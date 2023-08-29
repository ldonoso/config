vim.keymap.set("t", "<C-h>", "<C-W>:TmuxNavigateLeft<CR>", { silent = true })
vim.keymap.set("t", "<C-j>", "<C-W>:TmuxNavigateDown<CR>", { silent = true })
vim.keymap.set("t", "<C-k>", "<C-W>:TmuxNavigateUp<CR>", { silent = true })
vim.keymap.set("t", "<C-l>", "<C-W>:TmuxNavigateRight<CR>", { silent = true })

-- Disable tmux navigator when zooming the Vim pane
vim.g.tmux_navigator_disable_when_zoomed = 1

