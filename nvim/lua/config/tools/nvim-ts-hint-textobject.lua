local vim = vim

vim.api.nvim_set_keymap("o", "m", ":<C-U>lua require('tsht').nodes()<CR>", { silent = true })
vim.api.nvim_set_keymap("v", "m", ":lua require('tsht').nodes()<CR>", { noremap = true, silent = true })
