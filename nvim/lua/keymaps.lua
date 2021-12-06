local vim = vim

-- For lazy loading:
vim.api.nvim_set_keymap("n", "<leader>o", ":SymbolsOutline<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>tt", ":TroubleToggle<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>zm", ":ZenMode<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>tw", ":Twilight<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>ng", ":Neogit<CR>", { noremap = true, silent = true })

-- vim.api.nvim_set_keymap("n", "<leader>ca", ":CodeActionMenu<CR>", { noremap = true, silent = true })
