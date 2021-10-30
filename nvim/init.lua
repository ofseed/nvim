--[[
" Created by 1478zhcy on January 13, 2021.
" The purpose of writing this configuration
" file is to unify the experience of using
" Vim and Neovim on different platforms
" according to my personal preferences.
]]
--

local vim = vim

-- Edit config
vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.backup = false
vim.o.swapfile = false
vim.o.ignorecase = true
vim.o.compatible = false
vim.o.completeopt = "menu,menuone,noselect"
vim.o.list = true
vim.o.hidden = true

-- UI config
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = true
vim.o.linebreak = true
vim.o.showbreak = ">>"
vim.o.hlsearch = true
vim.o.ruler = true
vim.o.mouse = "a"
vim.o.showcmd = true
vim.o.laststatus = 2
vim.o.belloff = "all"
vim.o.termguicolors = true
vim.o.wildmenu = true
vim.o.title = true
vim.o.signcolumn = "yes"
vim.o.cursorline = true
vim.o.conceallevel = 1

-- Unicode config
vim.o.encoding = "utf-8"
vim.o.fileencodings = "utf-8,gbk2312,gbk,gb18030,cp936"

-- Keymap config
vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<leader><leader>", ":nohlsearch<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("c", "<C-p>", "<Up>", {})
vim.api.nvim_set_keymap("c", "<C-n>", "<Down>", {})

--Language config
vim.o.shortmess = "atI"
vim.o.langmenu = "en_US.UTF-8"

-- Colorscheme config
vim.g.tokyonight_transparent = false
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_sidebars = { "Outline", "packer" }
vim.cmd [[colorscheme tokyonight]]

-- Fcitx5 auto switch
vim.api.nvim_command "autocmd InsertLeave * :silent !fcitx5-remote -c"

require("impatient").enable_profile()
require "init"
