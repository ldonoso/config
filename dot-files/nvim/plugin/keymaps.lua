local set = vim.keymap.set

-- automatically jump to end of text you pasted
set("v", "y", "y`]")
set("v", "p", "p`]")
set("n", "p", "p`]")

-- after searches, center the display and unfold
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")
set("n", "*", "*zz")
set("n", "#", "#zz")
set("n", "g*", "g*zz")
set("n", "g#", "g#zz")
set("n", "*", "*``")

-- enter command mode with one keystroke
set("n", ";", ":")
set("n", ":", ";")

-- calculator
set("n", "Q", '0yt=A<C-r>=<C-r>"<CR><Esc>')

-- run command under cursor in terminal below
set("n", "<leader>r", '^y$<C-W>jpi<CR><C-\\><C-N><C-W>pj')

-- window management
set("n", "<leader>tc", "<cmd>tabclose<CR>")
set("n", "<C-W>T", "<cmd>tab split<CR>", { silent = true })

-- clear highlight
set("n", "<leader>c", "<cmd>nohlsearch<CR>:call clearmatches()<CR>", { silent = true })

-- disable arrow keys in normal mode
set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
