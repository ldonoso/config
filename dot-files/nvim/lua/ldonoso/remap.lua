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

-- enter command mode with one keystroke
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", ":", ";")

-- calculator
vim.keymap.set("n", "Q", '0yt=A<C-r>=<C-r>"<CR><Esc>')

-- run command under cursor in terminal below
vim.keymap.set("n", "<leader>r", '^y$<C-W>jpi<CR><C-\\><C-N><C-W>pj')

-- window management
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>")
vim.keymap.set("n", "<C-W>T", "<cmd>tab split<CR>", { silent = true})

-- line highlight
vim.keymap.set("n", "<leader>c", "<cmd>nohlsearch<CR>:call clearmatches()<CR>", { silent = true})
