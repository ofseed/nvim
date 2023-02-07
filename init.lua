-- Edit
vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.list = true
vim.o.includeexpr = "substitute(v:fname,'\\.','/','g')"

-- Interface
vim.o.number = true
vim.o.wrap = false
vim.o.linebreak = true
vim.o.showbreak = ">>"
vim.o.mouse = "a"
vim.o.termguicolors = true
vim.o.title = true
vim.o.signcolumn = "yes"
vim.o.cursorline = true
vim.o.cursorlineopt = "number"
vim.o.conceallevel = 1
vim.o.scrolloff = 2
vim.o.sidescrolloff = 5
vim.o.pumblend = 12

-- Keymapping
vim.o.pastetoggle = "<F2>"
vim.g.mapleader = " "
vim.keymap.set("c", "<C-p>", "<Up>")
vim.keymap.set("c", "<C-n>", "<Down>")
vim.cmd [[colorscheme habamax]]
vim.cmd [[aunmenu PopUp.How-to\ disable\ mouse]]
vim.cmd [[aunmenu PopUp.-1-]]
require "init"
