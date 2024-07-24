local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local LDonosoGroup = augroup('LDonoso', { clear = true })

-- todo: Investigate why it is necessary
autocmd({ "BufRead", "BufNewFile", }, {
	group = LDonosoGroup,
	pattern = "*.md",
	command = "set syntax=markdown",
})

autocmd({ "BufRead", "BufNewFile", }, {
	group = LDonosoGroup,
	pattern = "*.qml",
	command = "setfiletype qmljs",  -- only if filetype has not already been set
})

autocmd({ "BufRead", "BufNewFile", }, {
	group = LDonosoGroup,
	pattern = "*.make",
	command = "setfiletype make",  -- only if filetype has not already been set
})

autocmd({ "BufRead", "BufNewFile", }, {
	group = LDonosoGroup,
	pattern = "*.sql",
	command = "set filetype=sqlinformix",  -- overrides any filetype that has already been set
})

autocmd({ "BufRead", "BufNewFile", }, {
	group = LDonosoGroup,
	pattern = "*.ic",
	command = "set filetype=cpp",  -- overrides any filetype that has already been set
})

-- open a quickfix item in a new window
autocmd("Filetype", {
	group = LDonosoGroup,
	pattern = "qf",
	command = "nnoremap <buffer> <localleader><Enter> <C-w><Enter><C-w>L",
})

autocmd("FileType", {
	group = LDonosoGroup,
	pattern = {"xml", "git", },  -- when the event is FileType the pattern is the file type
	command = "set foldmethod=syntax",
})

-- last-position-jump
autocmd({ "BufReadPost", }, {
	group = LDonosoGroup,
	pattern = "*",
	command = [[if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' | exe "normal! g`\"" | endif]],
})

-- Highlight on yank
autocmd('TextYankPost', {
	group = LDonosoGroup,
	callback = function ()
		vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
	end
})

-- Remove whitespaces
autocmd({"BufWritePre"}, {
	group = LDonosoGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

-- Make panels equal size when main window is resized
autocmd({"VimResized"}, {
	group = LDonosoGroup,
	pattern = "*",
	command = [[ wincmd = ]],
})

