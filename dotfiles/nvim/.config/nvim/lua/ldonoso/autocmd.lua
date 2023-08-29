local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufRead", "BufNewFile", }, {
	pattern = "*.make",
	command = "set filetype make",  -- only if filetype has not already been set
})

autocmd({ "BufRead", "BufNewFile", }, {
	pattern = "*.sql",
	command = "set filetype=sqlinformix",  -- overrides any filetype that has already been set
})

autocmd({ "BufRead", "BufNewFile", }, {
	pattern = "*.ic",
	command = "set filetype=cpp",  -- overrides any filetype that has already been set
})

-- open a quickfix item in a new window
augroup('OpenQfNewBuffer', { clear = true })
autocmd("Filetype", {
    group = 'OpenQfNewBuffer',
	pattern = "qf",
	command = "nnoremap <buffer> <leader><Enter> <C-w><Enter><C-w>L",
})

autocmd("FileType", {
	pattern = {"xml", "git", },  -- when the event is FileType the pattern is the file type
	command = "set foldmethod = syntax",
})

-- last-position-jump
autocmd({ "BufReadPost", }, {
	pattern = "*",
	command = [[if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' | exe "normal! g`\"" | endif]],
})

local LDonosoGroup = augroup('LDonoso', { clear = true })

-- Highlight on yank
autocmd('TextYankPost', {
	group = LDonosoGroup,
	callback = function()
		vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
	end
})

-- Remove whitespaces
autocmd({"BufWritePre"}, {
    group = LDonosoGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
