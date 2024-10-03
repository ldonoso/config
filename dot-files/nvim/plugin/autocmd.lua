local autocmd = vim.api.nvim_create_autocmd

-- Create autocmds inside this group so they are not duplicated if autocmd.lua is loaded twice
local augroup = vim.api.nvim_create_augroup(
    'LDonoso',
    { clear = true } -- clear existing commands if the group exists
)

-- todo: Investigate why it is necessary
autocmd({ "BufRead", "BufNewFile", }, {
    group = augroup,
    pattern = "*.md",
    command = "set syntax=markdown",
})

autocmd({ "BufRead", "BufNewFile", }, {
    group = augroup,
    pattern = "*.qml",
    command = "setfiletype qmljs", -- only if filetype has not already been set
})

autocmd({ "BufRead", "BufNewFile", }, {
    group = augroup,
    pattern = "*.make",
    command = "setfiletype make", -- only if filetype has not already been set
})

autocmd({ "BufRead", "BufNewFile", }, {
    group = augroup,
    pattern = "*.sql",
    command = "set filetype=sqlinformix", -- overrides any filetype that has already been set
})

autocmd({ "BufRead", "BufNewFile", }, {
    group = augroup,
    pattern = "*.ic",
    command = "set filetype=cpp", -- overrides any filetype that has already been set
})

autocmd("FileType", {
    group = augroup,
    pattern = { "xml", "git", }, -- if event is FileType, the pattern is the file type
    command = "set foldmethod=syntax",
})

-- last-position-jump
autocmd({ "BufReadPost", }, {
    group = augroup,
    pattern = "*",
    command = [[if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' | exe "normal! g`\"" | endif]],
})

autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = augroup,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 1000 })
    end
})

-- Remove whitespaces
autocmd({ "BufWritePre" }, {
    group = augroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Make panels equal size when main window is resized
autocmd({ "VimResized" }, {
    group = augroup,
    pattern = "*",
    command = [[ wincmd = ]],
})
