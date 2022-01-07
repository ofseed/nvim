local vim = vim

vim.api.nvim_set_keymap("n", "<leader>db", ":DBUIToggle<CR>", { noremap = true, silent = true })

-- For lazy loading:
vim.api.nvim_set_keymap("n", "<leader>lo", ":SymbolsOutline<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>tt", ":TroubleToggle<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>zm", ":ZenMode<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>tw", ":Twilight<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>ng", ":Neogit<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>dvo", ":DiffviewOpen<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>dvf", ":DiffviewFileHistory<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>dvc", ":DiffviewClose<CR>", { noremap = true, silent = true })

-- vim.api.nvim_set_keymap("n", "<leader>ca", ":CodeActionMenu<CR>", { noremap = true, silent = true })
