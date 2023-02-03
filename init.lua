vim.cmd[[
" Edit
set expandtab
set softtabstop=2
set shiftwidth=2
set undofile
set ignorecase
set smartcase
set completeopt=menu,menuone,noselect
set list
set hidden
set includeexpr=substitute(v:fname,'\\.','/','g')

" Interface
set number
set nowrap
set linebreak
set showbreak=>>
set mouse=a
set termguicolors
set title
set signcolumn=yes
set cursorline
set cursorlineopt=number
set conceallevel=1
set scrolloff=2
set sidescrolloff=5
set fillchars+=diff:╱

" Keymapping
set pastetoggle=<F2>
let mapleader=" "
cmap <C-p> <Up>
cmap <C-n> <Down>

colorscheme habamax

aunmenu PopUp.How-to\ disable\ mouse
aunmenu PopUp.-1-
lua require "init"
]]
