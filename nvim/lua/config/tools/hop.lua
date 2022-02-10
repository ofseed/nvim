local hop = require "hop"

hop.setup {
  keys = "etovxqpdygfblzhckisuran",
  jump_on_sole_occurrence = false,
}

vim.api.nvim_set_keymap("n", "sf", "<Cmd>HopChar1AC<CR>", { noremap = true, silent = true }) -- Case ignored
vim.api.nvim_set_keymap("n", "<Leader><Leader>f", "<Cmd>HopChar1AC<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "sf", "<Cmd>HopChar1AC<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Leader><Leader>f", "<Cmd>HopChar1AC<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("o", "<Leader><Leader>f", "<Cmd>HopChar1AC<CR>", { noremap = true, silent = true })
-- t, T not implemented yet
vim.api.nvim_set_keymap("n", "sw", "<Cmd>HopWordAC<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader><Leader>w", "<Cmd>HopWordAC<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "sw", "<Cmd>HopWordAC<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Leader><Leader>w", "<Cmd>HopWordAC<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("o", "<Leader><Leader>w", "<Cmd>HopWordAC<CR>", { noremap = true, silent = true })
-- W not implemented yet
vim.api.nvim_set_keymap("n", "sb", "<Cmd>HopWordBC<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader><Leader>b", "<Cmd>HopWordBC<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "sb", "<Cmd>HopWordBC<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Leader><Leader>b", "<Cmd>HopWordBC<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("o", "<Leader><Leader>b", "<Cmd>HopWordBC<CR>", { noremap = true, silent = true })
-- B, e, E, ge, gE not implemented yet
vim.api.nvim_set_keymap("n", "sj", "<Cmd>HopLineStartAC<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader><Leader>j", "<Cmd>HopLineStartAC<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "sj", "<Cmd>HopLineStartAC<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Leader><Leader>j", "<Cmd>HopLineStartAC<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("o", "<Leader><Leader>j", "<Cmd>HopLineStartAC<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "sk", "<Cmd>HopLineStartBC<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader><Leader>k", "<Cmd>HopLineStartBC<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "sk", "<Cmd>HopLineStartBC<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Leader><Leader>k", "<Cmd>HopLineStartBC<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("o", "<Leader><Leader>k", "<Cmd>HopLineStartBC<CR>", { noremap = true, silent = true })
-- n, N not implemented yet
vim.api.nvim_set_keymap("n", "ss", "<Cmd>HopChar1MW<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader><Leader>s", "<Cmd>HopChar1MW<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "ss", "<Cmd>HopChar1MW<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Leader><Leader>s", "<Cmd>HopChar1MW<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("o", "<Leader><Leader>s", "<Cmd>HopChar1MW<CR>", { noremap = true, silent = true })
