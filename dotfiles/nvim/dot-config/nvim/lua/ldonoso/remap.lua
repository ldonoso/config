vim.keymap.set("n", "<leader>cfn", ":let @+=join([expand('%'),  line('.')], ':')<CR>")

-- automatically jump to end of text you pasted
vim.keymap.set("v", "y", "y`]")
vim.keymap.set("v", "p", "p`]")
vim.keymap.set("n", "p", "p`]")

-- after searches, center the display and unfold
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")
vim.keymap.set("n", "g*", "g*zz")
vim.keymap.set("n", "g#", "g#zz")
vim.keymap.set("n", "*", "*``")

-- Enter command mode with one keystroke
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", ":", ";")

-- calculator
vim.keymap.set("n", "Q", '0yt=A<C-r>=<C-r>"<CR><Esc>')

-- Run command under cursor in terminal below
vim.keymap.set("n", "<leader>r", '^y$<C-W>jpi<CR><C-\\><C-N><C-W>pj')

vim.keymap.set("n", "<leader>tc", ":tabclose<CR>")
vim.keymap.set("n", "<C-W>T", ":tab split<CR>", { silent = true})

-- line highlight
vim.keymap.set("n", "<leader>l", [[:call matchadd('Search', '\%'.line('.').'l')<CR>]], { silent = true})
vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>:call clearmatches()<CR>", { silent = true})
