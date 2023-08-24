function map(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true })
end

-- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Install package manager - https://github.com/folke/lazy.nvim
-- `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)


require('lazy').setup({

'ctrlpvim/ctrlp.vim', 

'flazz/vim-colorschemes',
'godlygeek/tabular',
'idanarye/vim-merginal',
'ivanov/vim-ipython',
'majutsushi/tagbar',  -- requires universal ctags
-- autocmd FileType tagbar setlocal nocursorline nocursorcolumn  " for tagbar slowness

{
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
},

'mileszs/ack.vim',
'nelstrom/vim-visual-star-search',
'tpope/vim-dispatch',
'tpope/vim-fugitive',

'tpope/vim-rhubarb',  -- GBrowse github
'tommcdo/vim-fubitive',  -- GBrowse bitbucket
'junegunn/gv.vim',
'tpope/vim-repeat',
'tpope/vim-surround',
'tpope/vim-unimpaired',
'tpope/vim-vinegar',
'tpope/vim-sleuth',
'ujihisa/tabpagecolorscheme',
'will133/vim-dirdiff',

'AndrewRadev/linediff.vim',

{
    'davidhalter/jedi-vim',
    ft = 'python'
},

'lyuts/vim-rtags',
'christoomey/vim-tmux-navigator',
'vim-airline/vim-airline',
'editorconfig/editorconfig-vim',
'lfv89/vim-interestingwords'

}, {})

vim.cmd([[

let g:ctrlp_working_path_mode = 0
let g:ctrlp_switch_buffer = 'et'
if executable('ag')
    " Use ag in CtrlP for listing files
    let g:ctrlp_user_command = 'ag --literal --files-with-matches --nocolor --hidden -g "" %s'
endif

if executable('ag')  " Use silver searcher when available
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " --skip-vcs-ignores
    let g:ackprg = 'ag --vimgrep'

    " Search selected text
    vnoremap <leader>s y:Ack! -Q -i '<C-R>"'<CR>
endif

nnoremap <leader>gs :Git<CR><C-w>20_
nnoremap <leader>gd :Gdiff!<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gb :Git blame<CR>

let g:linediff_first_buffer_command  = 'leftabove new'
let g:linediff_further_buffer_command = 'rightbelow vertical new'

let g:rtagsUseLocationList = 0  " Use QuickList

tnoremap <silent> <C-h> <C-W>:TmuxNavigateLeft<CR>
tnoremap <silent> <C-j> <C-W>:TmuxNavigateDown<CR>
tnoremap <silent> <C-k> <C-W>:TmuxNavigateUp<CR>
tnoremap <silent> <C-l> <C-W>:TmuxNavigateRight<CR>

let g:airline#extensions#tagbar#enabled = 1

" :set directory=~/.vim/swapfiles//
set autoread
set hidden  " switch between buffers without saving

" general encoding settings
set encoding=utf-8
set fileformats=unix,dos " new files will be encoded using unix line termination.
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab

set modeline  " read vim modelines
syntax on
au BufRead,BufNewFile *.make setfiletype make  " only if filetype has not already been set
au BufRead,BufNewFile *.sql set filetype=sqlinformix  " overrides any filetype that has already been set

set number " current line shows the global number
set relativenumber
set wildmode=longest,list
set mouse=  " disable mouse
set cursorline  " highlight current line
set belloff=all
set wildignore=*.o,*.obj,*.swp
let g:netrw_hide=1  " not show hidden files
let g:netrw_list_hide='.*\.swp$'
let g:netrw_preview=1  " Make vertical splitting the default for previewing files
"let g:netrw_liststyle=3  " Make the default listing style "tree"
let g:netrw_winsize=30  " When a vertical preview window is opened, the directory listing will use only 30%
set wrap linebreak  " break at a word boundary.

set laststatus=3  " when the last window will have a status line. 3: always and ONLY the last window

set incsearch hlsearch wrapscan ignorecase smartcase " search configuration
set shortmess-=S  " show number of occurrences

if has("gui_running")
    set guioptions-=m  " Remove menu bar
    set guioptions-=T  " Remove toolbar
    set guifont=Consolas:h11
endif

set colorcolumn=100
set background=dark
set termguicolors  " enables 24-bit RGB color in the TUI
colorscheme gruvbox

" tags. One tag file per directory and a general one
" in the working directory with the non-static definitions
set tags=./.tags,.tags  " Look for tags in current dir and in working dir
" set tags=./.tags;  " Look for tags file dir upwards

" Build the tag file in the dir of the current file
nnoremap ,t :!(cd %:p:h; ctags -f .tags *)&

" Windows
set splitbelow  " split will put the new window below of the current one
set splitright  " vsplit will put the new window right of the current one

" Center the display line after searches. http://www.vim.org/tips/tip.php?tip_id=528
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap * *``

" Enter command mode with one keystroke
nnoremap ; :
nnoremap : ;

set clipboard=unnamedplus  " use the clipboard (instead of the '+' and/or '*' registers)

set backspace=indent,eol,start  " backspace behave like you expect and go through everything

nnoremap <leader>tc :tabclose<CR>
nnoremap <silent> <C-W>T :tab split<CR>

" line highlight
nnoremap <silent> <leader>l :call matchadd('Search', '\%'.line('.').'l')<CR>
nnoremap <silent> <leader>c :nohlsearch<CR>:call clearmatches()<CR>

set diffopt+=vertical,indent-heuristic,algorithm:histogram

" open a quickfix item in a new window
autocmd! FileType qf nnoremap <buffer> <leader><Enter> <C-w><Enter><C-w>L

" calculator
nnoremap Q 0yt=A<C-r>=<C-r>"<CR><Esc>

" Run command under cursor in terminal below
nnoremap <leader>r ^y$<C-W>b<C-W>""<CR><C-W>pj

" folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
let g:xml_syntax_folding=1
autocmd FileType xml set foldmethod=syntax
autocmd FileType git set foldmethod=syntax

" clang format
noremap <leader>cf :py3f /usr/share/clang/clang-format-10/clang-format.py<cr>
let g:clang_format_fallback_style = 'none'

" termdebug
if !has('win32')
    " https://gavinhoward.com/2020/12/my-development-environment-and-how-i-got-there/
    packadd termdebug
    let g:termdebug_wide = 1
    nnoremap <F5> :Continue<CR>
    nnoremap <F1> :Over<CR>
    nnoremap <F2> :Step<CR>
    nnoremap <S-F2> :Finish<CR>
endif

" last-position-jump
autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif

set makeprg=cmake

" Set the filetype based on the file's extension, but only if
" 'filetype' has not already been set
au BufRead,BufNewFile *.ic setfiletype cpp

" For Windows WSL, try this g:clipboard definition:
let g:clipboard = {
                \   'name': 'WslClipboard',
                \   'copy': {
                \      '+': 'clip.exe',
                \      '*': 'clip.exe',
                \    },
                \   'paste': {
                \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
                \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
                \   },
                \   'cache_enabled': 0,
                \ }

]])

vim.opt.diffopt:append('linematch:60')  -- nvim exclusive option

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "cpp", "sql", "markdown", "haskell", },

  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- folding using treesitter
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

vim.g.EditorConfig_exclude_patterns = "['fugitive://.*']"

vim.g.interestingWordsGUIColors = "['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']"

map("n", "<leader>cfn", ":let @+=join([expand('%'),  line('.')], ':')<CR>")

-- line diff between two diff markers
map("n", "<leader>ld", "jV]nk:Linediff<CR>]njV]nk:Linediff<CR>")

-- automatically jump to end of text you pasted
map("v", "y", "y`]")
map("v", "p", "p`]")
map("n", "p", "p`]")

--vim.g.netrw_browsex_viewer = "cmd.exe /C start"  -- open url with vim in ubuntu wsl

-- Disable tmux navigator when zooming the Vim pane
vim.g.tmux_navigator_disable_when_zoomed = 1
