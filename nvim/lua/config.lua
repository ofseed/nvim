--[[
" Created by 1478zhcy on January 13, 2021.
" The purpose of writing this configuration
" file is to unify the experience of using
" Vim and Neovim on different platforms
" according to my personal preferences.
" *
]]--

local vim = vim

-- Edit config
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.backup = false
vim.o.swapfile = false
vim.o.ignorecase = true
vim.o.compatible = false
vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = "menuone,noselect"
vim.o.list = true
vim.o.hidden = true

-- UI config
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = true
vim.o.linebreak = true
vim.o.showbreak = '>>'
vim.o.hlsearch = true
vim.o.ruler = true
vim.o.mouse = 'a'
vim.o.showcmd = true
vim.o.laststatus=2
vim.o.belloff= 'all'
vim.o.termguicolors = true
vim.o.wildmenu = true
vim.o.title = true
vim.o.signcolumn = 'yes'
vim.o.cursorline = true
vim.o.conceallevel=1

-- Unicode config
vim.o.encoding = 'utf-8'
vim.o.fileencodings = 'utf-8,gbk2312,gbk,gb18030,cp936'

-- Keymap config
vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '<leader><leader>', ':nohlsearch<CR>', { noremap= true, silent = true})
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-q>', ':bp! | bd!#<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':bn<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-a>', ':bp<CR>', { noremap = true, silent = true })

--Language config
vim.o.shortmess = "atI"
vim.o.langmenu = "en_US.UTF-8"

-- Colorscheme config
vim.g.colors_name = 'dracula'

require('plugins')
require('config.language')
require('config.interface')
require('config.tools')

