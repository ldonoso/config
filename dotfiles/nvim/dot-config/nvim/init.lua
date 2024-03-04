-- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- { Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup("plugins", {})

-- }

if vim.fn.executable('ag') == 1 then  -- Use silver searcher when available
    -- Use ag over grep
    vim.opt.grepprg = "ag --nogroup --nocolor"

    -- --skip-vcs-ignores
    vim.g.ackprg = 'ag --vimgrep'
end

vim.g.rtagsUseLocationList = 0  -- Use QuickList

vim.cmd [[ syntax on ]]  -- implies filetype on

-- tags. One tag file per directory and a general one
-- in the working directory with the non-static definitions
vim.opt.tags = { "./.tags", ".tags" }  -- Look for tags in current dir and in working dir

-- Build the tag file in the dir of the current file
vim.keymap.set("t", ",t", ":!(cd %:p:h; ctags -f .tags *)&")

-- folding
vim.opt.foldnestmax = 10
vim.opt.foldenable = false  -- all folds are open
vim.opt.foldlevel = 2
vim.g.xml_syntax_folding = 1

-- clang format
vim.keymap.set("n", "<leader>cf", ":py3f /usr/share/clang/clang-format-10/clang-format.py<cr>")
vim.g.clang_format_fallback_style = 'none'

-- termdebug
if vim.fn.has('win32') == 0 then
    -- https://gavinhoward.com/2020/12/my-development-environment-and-how-i-got-there/
    vim.cmd [[ packadd termdebug ]]
    vim.g.termdebug_wide = 1
    vim.keymap.set("n", "<F5>", ":Continue<CR>")
    vim.keymap.set("n", "<F1>", ":Over<CR>")
    vim.keymap.set("n", "<F2>", ":Step<CR>")
    vim.keymap.set("n", "<S-F2>", ":Finish<CR>")
end

-- For Windows WSL, try this g:clipboard definition:
if vim.fn.has("wsl") == 1 then
    vim.g.clipboard = {
        name = 'WslClipboard',
        copy = {
            ['+'] = 'clip.exe',
            ['*'] = 'clip.exe',
        },
        paste = {
            ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = 0,
    }
end

require("ldonoso")
