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
set list

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
"set noshowmode
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
nnoremap <leader><leader> :nohlsearch<CR>
inoremap jj <ESC>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nnoremap <C-Q> :bp! \| bd!#<CR>
nnoremap <C-S> :bn!<CR>
nnoremap <C-A> :bp!<CR>

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
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ryanoasis/vim-devicons'
"Plug 'michaeljsmith/vim-indent-object'
"Plug 'Yggdroot/indentLine'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'hrsh7th/nvim-compe'
Plug 'sbdchd/neoformat'

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'akinsho/nvim-bufferline.lua'
Plug 'glepnir/dashboard-nvim'
Plug 'kyazdani42/nvim-tree.lua'

"Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
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
let g:airline#extensions#tabline#enabled = 0

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
"Spaceline.nvim config
let g:spaceline_seperate_style = 'none'

"Nvim-Tree config
let g:nvim_tree_side = 'left' "left by default
let g:nvim_tree_width =30 "30 by default, can be width_in_columns or 'width_in_percent%'
let g:nvim_tree_ignore = [] "empty by default
let g:nvim_tree_gitignore = 0 "0 by default
let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard'] "empty by default, don't auto open tree on specific filetypes.
let g:nvim_tree_quit_on_open = 0 "0 by default, closes the tree when you open a file
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 0 "0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_auto_resize = 0 "1 by default, will resize the tree to its saved width when opening a file
let g:nvim_tree_disable_netrw = 1 "1 by default, disables netrw
let g:nvim_tree_hijack_netrw = 1 "1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
let g:nvim_tree_add_trailing = 0 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 0 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_lsp_diagnostics = 1 "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
let g:nvim_tree_hijack_cursor = 0 "1 by default, when moving cursor in the tree, will position the cursor at the start of the file on the current line
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_update_cwd = 0 "0 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
let g:nvim_tree_special_files = {} " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }

nnoremap <leader>e :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen and NvimTreeClose are also available if you need them

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

"Dashcoard-nvim config
let g:dashboard_default_executive ='fzf'
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

if has('nvim')
    luafile ~/.config/nvim/lua/init.lua
endif

