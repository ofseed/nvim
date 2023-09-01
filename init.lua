vim.o.exrc = true

-- Edit
vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.list = true
vim.o.completeopt = "menu,menuone,noselect"
vim.o.includeexpr = "substitute(v:fname,'\\.','/','g')"

-- Interface
vim.o.splitkeep = "screen"
vim.o.splitbelow = true
vim.o.splitright = true
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
vim.o.fillchars = "foldopen:,foldclose:,foldsep: ,diff:╱"
vim.o.textwidth = 80
vim.o.guifont = "Cascadia Code PL:h14"

-- Keymapping
vim.g.mapleader = " "
vim.g.maplocalleader = "  "
vim.keymap.set("c", "<C-p>", "<Up>")
vim.keymap.set("c", "<C-n>", "<Down>")

-- Environment variables
vim.env.LAZYROOT = vim.fs.joinpath(vim.fn.stdpath "data", "lazy")

-- Filetype specific
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  desc = "Set indent for go",
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.expandtab = false
  end,
})

vim.cmd [[colorscheme habamax]]
vim.cmd [[aunmenu PopUp.How-to\ disable\ mouse]]
vim.cmd [[aunmenu PopUp.-1-]]
require "init"
