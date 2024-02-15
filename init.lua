vim.o.exrc = true

-- Edit
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.list = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.includeexpr = "substitute(v:fname,'\\.','/','g')"
vim.opt.jumpoptions = "stack"

-- Interface
vim.opt.confirm = true
vim.opt.splitkeep = "screen"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.number = true
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.opt.mouse = "a"
vim.opt.mousemoveevent = true
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.conceallevel = 2
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 5
vim.opt.smoothscroll = true
vim.opt.pumblend = 12
vim.opt.pumheight = 12
vim.opt.fillchars = { diff = "╱", foldopen = "", foldclose = "", foldsep = "▕" }
vim.opt.colorcolumn = "81"
vim.opt.guifont = "Cascadia Code PL:h14"
vim.opt.shortmess:append "I"

-- Keymapping
vim.g.mapleader = " "
vim.g.maplocalleader = "  "
vim.keymap.set("c", "<C-p>", "<Up>")
vim.keymap.set("c", "<C-n>", "<Down>")

-- Environment variables
---@diagnostic disable-next-line: param-type-mismatch
vim.env.LAZYROOT = vim.fs.joinpath(vim.fn.stdpath "data", "lazy")

vim.cmd [[aunmenu PopUp.How-to\ disable\ mouse]]
vim.cmd [[aunmenu PopUp.-1-]]

vim.loader.enable()
require "init"
