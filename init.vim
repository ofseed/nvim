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
set nowrap
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

  nmap [b :bp<CR>
  nmap ]b :bn<CR>
  nmap <leader>ff <Action>(GotoFile)
  nmap <leader>F <Action>(ReformatCode)
  nmap <leader>rn <Action>(RenameElement)
  nmap <leader>ca <Action>(ShowIntentionActions)
  nmap <leader>b <Action>(ToggleLineBreakpoint)

  nmap <leader>a <Action>(ActivateStructureToolWindow)
  nmap <C-\> <Action>(ActivateTerminalToolWindow)

  nmap <leader>e :NERDTree<CR>

  sethandler <C-2> a:vim
  sethandler <C-S-2> a:vim
  sethandler <C-6> a:vim
  sethandler <C-S-6> a:vim
  sethandler <C-;> a:vim
  sethandler <C-S-;> a:vim
  sethandler <C-A> a:vim
  sethandler <C-B> a:vim
  sethandler <C-C> a:vim
  sethandler <C-D> a:vim
  sethandler <C-E> a:vim
  sethandler <C-F> a:vim
  sethandler <C-G> a:vim
  sethandler <C-H> a:vim
  sethandler <C-I> a:vim
  sethandler <C-J> a:ide
  sethandler <C-K> a:vim
  sethandler <C-L> a:vim
  sethandler <C-M> a:vim
  sethandler <C-N> a:vim
  sethandler <C-O> a:vim
  sethandler <C-P> a:vim
  sethandler <C-Q> a:vim
  sethandler <C-R> a:vim
  sethandler <C-S> a:vim
  sethandler <C-T> a:vim
  sethandler <C-U> a:vim
  sethandler <C-V> a:vim
  sethandler <C-W> a:vim
  sethandler <C-X> a:vim
  sethandler <C-Y> a:vim
  sethandler <C-[> a:vim
  sethandler <C-]> a:vim
endif
