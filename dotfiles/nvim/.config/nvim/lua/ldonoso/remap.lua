vim.keymap.set("n", "<leader>cfn", ":let @+=join([expand('%'),  line('.')], ':')<CR>")

-- line diff between two diff markers
vim.keymap.set("n", "<leader>ld", "jV]nk:Linediff<CR>]njV]nk:Linediff<CR>")

-- automatically jump to end of text you pasted
vim.keymap.set("v", "y", "y`]")
vim.keymap.set("v", "p", "p`]")
vim.keymap.set("n", "p", "p`]")

-- Center the display line after searches. http://www.vim.org/tips/tip.php?tip_id=528
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
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
vim.keymap.set("n", "<leader>r", '^y$<C-W>b<C-W>""<CR><C-W>pj')

vim.keymap.set("n", "<leader>tc", ":tabclose<CR>")
vim.keymap.set("n", "<C-W>T", ":tab split<CR>", { silent = true})

-- line highlight
vim.keymap.set("n", "<leader>l", [[:call matchadd('Search', '\%'.line('.').'l')<CR>]], { silent = true})
vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>:call clearmatches()<CR>", { silent = true})
