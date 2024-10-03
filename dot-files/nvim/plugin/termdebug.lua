local set = vim.keymap.set

if vim.fn.has('win32') == 0 then
    -- https://gavinhoward.com/2020/12/my-development-environment-and-how-i-got-there/
    vim.cmd [[ packadd termdebug ]]
    vim.g.termdebug_wide = 1
    set("n", "<F5>", "<cmd>Continue<CR>")
    set("n", "<F1>", "<cmd>Over<CR>")
    set("n", "<F2>", "<cmd>Step<CR>")
    set("n", "<S-F2>", "<cmd>Finish<CR>")
end
