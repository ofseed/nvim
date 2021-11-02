local vim = vim
local nabla = require "nabla"

vim.api.nvim_set_keymap("n", "<leader>p", ":lua require'nabla'.popup()<CR>", { noremap = true })
