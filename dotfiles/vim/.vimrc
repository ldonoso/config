call plug#begin('~/.vim/bundle')
Plug 'christoomey/vim-tmux-navigator' 
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_working_path_mode = 0
if executable('ag')
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag --literal --files-with-matches --nocolor --hidden -g "" %s'
endif

Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/tabular'
Plug 'idanarye/vim-merginal'
Plug 'ivanov/vim-ipython'
Plug 'majutsushi/tagbar'
autocmd FileType tagbar setlocal nocursorline nocursorcolumn  " tagbar slowness

Plug 'mileszs/ack.vim'
if executable('ag')  " Use silver searcher when available
    let g:ackprg = 'ag --vimgrep'
endif

Plug 'nelstrom/vim-visual-star-search'
Plug 'tpope/vim-markdown'
let g:markdown_folding = 1
let g:markdown_fenced_languages = ['html', 'python', 'haskell', 'cpp', 'c']
let g:markdown_syntax_conceal = 0

Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'ujihisa/tabpagecolorscheme'
Plug 'vim-scripts/BufOnly.vim'
Plug 'vim-scripts/a.vim'
Plug 'will133/vim-dirdiff'
Plug 'kien/rainbow_parentheses.vim'

Plug 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { "mode": "active", "passive_filetypes": ["markdown"] }

if !has('win32')
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
endif

Plug 'davidhalter/jedi-vim'
call plug#end()

" :set directory=~/.vim/swapfiles//
set autoread
set hidden

" Encoding stuff
set encoding=utf-8
set fileformats=unix,dos " New files will be encoded using unix line termination.

set tabstop=4 shiftwidth=4 softtabstop=4 expandtab   
syntax on
set number " current line shows the global number
set relativenumber
set wildmode=longest,list
set mouse=a
set cursorline
set belloff=all
set wildignore=*.o,*.obj,*.swp
let g:netrw_hide=1  " Show not hidden files
let g:netrw_list_hide= '.*\.swp$'

let mapleader=" "

" Search stuff
set incsearch hlsearch
set ignorecase smartcase
" conflicts with tmux navigator
" nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

if has("gui_running")
    set guioptions-=m  " Remove menu bar
    set guioptions-=T  " Remove toolbar
    set guifont=Consolas:h11
endif

set colorcolumn=100
set background=dark
colorscheme gruvbox

" tags. One tag file per directory and a general one
" in the working directory with the non-static definitions
set tags=./.tags,.tags  " Look for tags in current dir and in working dir
" set tags=./.tags;  " Look for tags file dir upwards

" Build the tag file in the dir of the current file
nnoremap ,t :!(cd %:p:h; ctags -f .tags *)&

" Windows
set splitright
set splitbelow

" Center the display line after searches. (This makes it *much* easier to see the matched line.)
" More info: http://www.vim.org/tips/tip.php?tip_id=528
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

set diffopt+=vertical

if has("patch-8.1.0360")
    set diffopt+=algorithm:histogram
endif

" Open a quickfix item in a new window
autocmd! FileType qf nnoremap <buffer> <leader><Enter> <C-w><Enter><C-w>L

" Automatically jump to end of text you pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" calculator
nnoremap Q 0yt=A<C-r>=<C-r>"<CR><Esc>

" folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
let g:xml_syntax_folding=1
autocmd FileType xml setlocal foldmethod=syntax

" remaps
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>ge :Gedit<CR>

nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap <leader>fi :YcmCompleter FixIt<CR>
nnoremap <leader>gd :YcmCompleter GetDoc<CR>
nnoremap <leader>gtp :YcmCompleter GetType<CR>
nnoremap <leader>gp :YcmCompleter GetParent<CR>
nnoremap <leader>gti :YcmCompleter GoToInclude<CR>
nnoremap <leader>gdf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gdc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>yd :YcmDiags<CR>
