" Edit
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

" Interface
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

" Encoding
set encoding=utf-8
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936

" Keymapping
set pastetoggle=<F2>
let mapleader=" "
nnoremap <silent> <BS> :nohlsearch<CR>
cmap <C-p> <Up>
cmap <C-n> <Down>

" Filetype
autocmd BufNewFile,BufRead .clang-tidy set filetype=yaml

" Fcitx5 auto switch
" Every time exit insert mode, automatically close fcitx5
autocmd InsertLeave * :silent !fcitx5-remote -c

" Binary
" Enter binary mode when editing a file with postfix 'bin'
augroup Binary
  autocmd!
  autocmd BufReadPre  *.bin let &bin=1
  autocmd BufReadPost *.bin if &bin | %!xxd
  autocmd BufReadPost *.bin set filetype=xxd | endif
  autocmd BufWritePre *.bin if &bin | %!xxd -r
  autocmd BufWritePre *.bin endif
  autocmd BufWritePost *.bin if &bin | %!xxd
  autocmd BufWritePost *.bin set nomod | endif
augroup END

" Cursor
" Set cursor shape to beam instead of block,
" using in tmux
augroup ResetNvimCursor
  autocmd!
  autocmd VimEnter,VimResume * set guicursor=n-v-c-sm:block-blinkon100,i-ci-ve:ver25-blinkon100,r-cr-o:hor20-blinkon100
  autocmd VimLeave,VimSuspend * set guicursor=a:ver25-blinkon100
augroup END

" Neovim
if has("nvim")
  lua require "init"
else
  map s <Plug>(easymotion-prefix)
  map <leader><leader> <Plug>(easymotion-prefix)
endif

" Ideavim
if has("ide")
  set ideamarks
  set ideajoin

  Plug 'easymotion/vim-easymotion'
  Plug 'preservim/nerdtree'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'

  nmap <leader>e :NERDTree<CR>
  nmap <leader>F <Action>(ReformatCode)

  sethandler <C-W> n-v:ide i:vim
  sethandler <C-U> a:vim
endif
