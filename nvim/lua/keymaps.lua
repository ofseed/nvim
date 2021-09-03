local vim = vim

-- For lazy loading:
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true,  silent = true })

vim.api.nvim_set_keymap('n', '<leader>o', ':SymbolsOutline<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>tt", ":TroubleToggle<CR>", { noremap = true , silent = true })

vim.api.nvim_set_keymap("n", "<leader>zm", ":ZenMode<CR>", { noremap = true , silent = true })

vim.api.nvim_set_keymap('n', '<leader>F', ':Neoformat<CR>', { noremap = true, silent = true })
