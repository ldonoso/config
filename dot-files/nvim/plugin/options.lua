local opt             = vim.opt

opt.number            = true -- current line shows the global number
opt.relativenumber    = true
opt.wildmode          = { "longest", "list" }
opt.mouse             = {}   -- disable mouse
opt.cursorline        = true -- highlight current line
opt.belloff           = "all"
opt.wildignore        = { '*.o', '*.obj', '*.swp' }
vim.g.netrw_hide      = 1    -- not show hidden files
vim.g.netrw_list_hide = [[.*\.swp$]]
vim.g.netrw_preview   = 1    -- Make vertical splitting the default for previewing files
--vim.g.netrw_liststyle = 3  -- Make the default listing style "tree"
vim.g.netrw_winsize   = 30   -- When a vertical preview window is opened, the directory listing will use only 30%
opt.wrap              = true
opt.breakindent       = true -- Every wrapped line will continue visually indented (same amount of space as the beginning of that line), thus preserving horizontal blocks of text.
opt.linebreak         = true -- break at a word boundary.

opt.laststatus        = 2    -- when the last window will have a status line. 3: always and ONLY the last window

opt.incsearch         = true -- incremental search
opt.hlsearch          = true

opt.wrapscan          = true
opt.ignorecase        = true
opt.smartcase         = true

opt.shortmess:remove { 'S' } -- show number of occurrences

if vim.fn.has("gui_running") == 1 then
    opt.guioptions:remove { 'm' } -- Remove menu bar
    opt.guioptions:remove { 'T' } -- Remove toolbar
    opt.guifont = "Consolas:h11"
end

opt.scrolloff = 8 -- minimal number of screen lines to keep above and below the cursor.
opt.colorcolumn = "100"
opt.background = "dark"
opt.termguicolors = true -- enables 24-bit RGB color in the TUI

if vim.fn.has("wsl") == 1 then
    vim.g.netrw_browsex_viewer = "wslview"
end

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- :opt.directory=~/.vim/swapfiles//
opt.autoread = true
opt.hidden = true -- switch between buffers without saving

-- general encoding settings
opt.encoding = "utf-8"
opt.fileformats = { "unix", "dos" } -- new files will be encoded using unix line termination.

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.modeline = true -- read vim modelines

-- Windows
opt.splitbelow = true                        -- split will put the new window below of the current one
opt.splitright = true                        -- vsplit will put the new window right of the current one

opt.backspace = { "indent", "eol", "start" } -- backspace behave like you expect and go through everything

opt.diffopt:append({
    "vertical",
    "indent-heuristic",
    "algorithm:patience",
    "linematch:60",
})

-- folding
opt.foldnestmax = 10
opt.foldenable = false -- all folds are open
opt.foldlevel = 2
vim.g.xml_syntax_folding = 1

-- tags. One tag file per directory and a general one
-- in the working directory with the non-static definitions
opt.tags = { "./.tags", ".tags" } -- Look for tags in current dir and in working dir

vim.g.rtagsUseLocationList = 0    -- Use QuickList

if vim.fn.executable('rg') == 1 then
    opt.grepprg = "rg --vimgrep --smart-case" -- program to use for the :grep command
end
