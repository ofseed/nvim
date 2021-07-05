" *
" Created by 1478zhcy on January 13, 2021.
" The purpose of writing this configuration
" file is to unify the experience of using
" Vim and Neovim on different platforms
" according to my personal preferences.
" *

"Edit config
set expandtab
set softtabstop=4
set shiftwidth=4
set autochdir
set nobackup
set noswapfile
set ignorecase
set nocompatible
set clipboard=unnamedplus
set shortmess+=c

"UI config
syntax on
set number
set wrap
set linebreak
set hlsearch
set ruler
set mouse=a
set showcmd
set laststatus=2
set belloff=all
set termguicolors
set noshowmode
set wildmenu
set title
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
set cursorline
if !has('nvim')
    set cursorlineopt=number
"    let &t_SI.="\e[5 q"
"    let &t_SR.="\e[4 q"
"    let &t_EI.="\e[1 q"
endif
if has('win32')
    set guifont=Cascadia\ Code\ PL:h10.5
    if !has('nvim')
        set guifontwide=黑体:h10.5
    else
        set guifontwide=思源雅黑:h11
    endif
endif

"Unicode config
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936

"Keymap config
let mapleader = " "
inoremap jj <ESC>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nnoremap <C-Q> :bp! \| bd!#<CR>
if has("gui_running")
    nnoremap <C-tab> :bn!<CR>
    nnoremap <C-S-tab> :bp!<CR>
else
    nnoremap <C-X> :bn!<CR>
    nnoremap <C-Z> :bp!<CR>
endif

"Language config
set shortmess=atI
set langmenu=en_US.UTF-8
let $LANG= 'en_US.UTF-8'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"Terminal config
if !has('nvim')
    set termwinsize=8x0
    map <F1> :rightbelow terminal pwsh<CR>
endif

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ryanoasis/vim-devicons'
"Plug 'michaeljsmith/vim-indent-object'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
"Plug 'tpope/vim-fugitive'
call plug#end()

colorscheme dracula

"Startify config
let g:startify_custom_header = [
    \' ╭───────────────────────────────────────────────╮ ',
    \' │                                               │ ',
    \' │    ███     ███  ████      ███       ███       │ ',
    \' │   ░░██    ░██  ░░██      ██░██    ░██░██      │ ',
    \' │    ░██    ░██   ░██     ░██░██    ░██░██      │ ',
    \' │    ░░██   ██    ░██     ██ ░░██   ██ ░░██     │ ',
    \' │     ░██  ░██    ░██    ░██  ░██  ░██  ░██     │ ',
    \' │     ░░██ ██     ░██    ██   ░░██ ██   ░░██    │ ',
    \' │      ░██░██     ░██   ░██    ░██░██    ░██    │ ',
    \' │      ░░███      ████  ████   ░░███     ████   │ ',
    \' │       ░░░      ░░░   ░░░░     ░░░     ░░░░    │ ',
    \' │                  Customized By Zhang Caiyi.   │ ',
    \' ╰───────────────────────────────────────────────╯ ',
    \]
let g:startify_files_number = 5
let g:startify_session_autoload = 1
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction


"AirLine config
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"NERDTree config
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
map <Leader>e :NERDTreeToggle %<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \}

"FZF config
nnoremap <Leader>f :FZF<CR>

"VimTeX config
set conceallevel=1
let g:tex_flavor = 'latex'
let g:vimtex_quickfix_mode = 0
if has('unix')
    let g:vimtex_view_general_viewer = 'zathura'
    let g:vimtex_view_method = 'zathura'
endif
let g:vimtex_compiler_latexmk_engines = {'_':'-xelatex'}
let g:vimtex_compiler_latexrun_engines ={'_':'xelatex'}
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_toc_config = {
\ 'name' : 'TOC',
\ 'layers' : ['content', 'todo', 'include'],
\ 'split_width' : 25,
\ 'todo_sorted' : 0,
\ 'show_help' : 1,
\ 'show_numbers' : 1,
\}

