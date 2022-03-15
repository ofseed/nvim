" Created by Yi Ming on January 13, 2021.
" The purpose of writing this configuration
" file is to unify the experience of using
" Vim and Neovim on different platforms
" according to my personal preferences.

" Edit config
set expandtab
set softtabstop=2
set shiftwidth=2
set smarttab
set backspace=indent,eol,start
set nobackup
set noswapfile
set ignorecase
set smartcase
set autoindent
set nocompatible
set completeopt=menu,menuone,noselect
set list
set hidden
set includeexpr=substitute(v:fname,'\\.','/','g')

" UI config
set number
set wrap
set linebreak
set showbreak=>>
set hlsearch
set ruler
set mouse=a
set showcmd
set laststatus=2
set belloff=all
set termguicolors
set wildmenu
set title
set signcolumn=yes
set cursorline
set cursorlineopt=number
set conceallevel=1
set scrolloff=1
set sidescrolloff=5
set display+=lastline,msgsep

" Unicode config
set encoding=utf-8
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936

" Keymapping config
set pastetoggle=<F2>
let mapleader=" "
nnoremap <silent> <BS> :nohlsearch<CR>
cmap <C-p> <Up>
cmap <C-n> <Down>

" Filetype config
autocmd BufNewFile,BufRead .clang-tidy set filetype=yaml

" Fcitx5 auto switch
autocmd InsertLeave * :silent !fcitx5-remote -c

" Binary config
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END

" Cursor config
augroup ResetNvimCursor
  autocmd!
  autocmd VimEnter,VimResume * set guicursor=n-v-c-sm:block-blinkon100,i-ci-ve:ver25-blinkon100,r-cr-o:hor20-blinkon100
  autocmd VimLeave,VimSuspend * set guicursor=a:ver25-blinkon100
augroup END

" Neovim config
if has("nvim")
  lua require "init"
else
  map s <Plug>(easymotion-prefix)
  map <leader><leader> <Plug>(easymotion-prefix)
endif

" Ideavim config
if has("ide")
  set ideamarks
  set ideajoin

  Plug 'easymotion/vim-easymotion'
  Plug 'preservim/nerdtree'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'

  map <leader>e :NERDTree<CR>
  nnoremap <leader>F <Action>(ReformatCode)

  sethandler <C-W> n-v:ide i:vim
  sethandler <C-U> a:vim
endif
