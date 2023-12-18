vim.o.exrc = true

-- Edit
vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.undofile = true
vim.o.swapfile = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.list = true
vim.o.completeopt = "menu,menuone,noselect"
vim.o.includeexpr = "substitute(v:fname,'\\.','/','g')"
vim.o.jumpoptions = "stack"

-- Interface
vim.o.confirm = true
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
vim.o.conceallevel = 2
vim.o.scrolloff = 2
vim.o.sidescrolloff = 5
vim.o.pumblend = 12
vim.o.pumheight = 12
vim.o.fillchars = "diff:╱"
vim.o.textwidth = 80
vim.o.colorcolumn = "+1"
vim.o.guifont = "Cascadia Code PL:h14"

-- Keymapping
vim.g.mapleader = " "
vim.g.maplocalleader = "  "
vim.keymap.set("c", "<C-p>", "<Up>")
vim.keymap.set("c", "<C-n>", "<Down>")

-- Environment variables
---@diagnostic disable-next-line: param-type-mismatch
vim.env.LAZYROOT = vim.fs.joinpath(vim.fn.stdpath "data", "lazy")

-- Auto commands
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_on_yank", {}),
  desc = "Briefly highlight yanked text",
  callback = function()
    vim.highlight.on_yank()
  end,
})

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

vim.cmd [[aunmenu PopUp.How-to\ disable\ mouse]]
vim.cmd [[aunmenu PopUp.-1-]]
require "init"
