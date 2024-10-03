vim.opt.number         = true -- current line shows the global number
vim.opt.relativenumber = true
vim.opt.wildmode       = { "longest", "list" }
vim.opt.mouse          = {}   -- disable mouse
vim.opt.cursorline     = true -- highlight current line
vim.opt.belloff        = "all"
vim.opt.wildignore     = { '*.o', '*.obj', '*.swp' }
vim.g.netrw_hide       = 1    -- not show hidden files
vim.g.netrw_list_hide  = [[.*\.swp$]]
vim.g.netrw_preview    = 1    -- Make vertical splitting the default for previewing files
--vim.g.netrw_liststyle = 3  -- Make the default listing style "tree"
vim.g.netrw_winsize    = 30   -- When a vertical preview window is opened, the directory listing will use only 30%
vim.opt.wrap           = true
vim.opt.breakindent    = true -- Every wrapped line will continue visually indented (same amount of space as the beginning of that line), thus preserving horizontal blocks of text.
vim.opt.linebreak      = true -- break at a word boundary.

vim.opt.laststatus     = 2    -- when the last window will have a status line. 3: always and ONLY the last window

vim.opt.incsearch      = true -- incremental search
vim.opt.hlsearch       = true

vim.opt.wrapscan       = true
vim.opt.ignorecase     = true
vim.opt.smartcase      = true

vim.opt.shortmess:remove { 'S' } -- show number of occurrences

if vim.fn.has("gui_running") == 1 then
    vim.opt.guioptions:remove { 'm' } -- Remove menu bar
    vim.opt.guioptions:remove { 'T' } -- Remove toolbar
    vim.opt.guifont = "Consolas:h11"
end

vim.opt.scrolloff = 8 -- minimal number of screen lines to keep above and below the cursor.
vim.opt.colorcolumn = "100"
vim.opt.background = "dark"
vim.opt.termguicolors = true -- enables 24-bit RGB color in the TUI

if vim.fn.has("wsl") == 1 then
    vim.g.netrw_browsex_viewer = "wslview"
end

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- :vim.opt.directory=~/.vim/swapfiles//
vim.opt.autoread = true
vim.opt.hidden = true -- switch between buffers without saving

-- general encoding settings
vim.opt.encoding = "utf-8"
vim.opt.fileformats = { "unix", "dos" } -- new files will be encoded using unix line termination.

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.modeline = true -- read vim modelines

-- Windows
vim.opt.splitbelow = true -- split will put the new window below of the current one
vim.opt.splitright = true -- vsplit will put the new window right of the current one

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.backspace = { "indent", "eol", "start" } -- backspace behave like you expect and go through everything

vim.opt.diffopt:append({
    "vertical",
    "indent-heuristic",
    "algorithm:patience",
    "linematch:60",
})
