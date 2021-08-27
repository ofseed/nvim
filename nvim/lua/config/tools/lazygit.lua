local vim = vim

-- setup mapping to call :LazyGit
vim.api.nvim_set_keymap('n', '<leader>lg', ':LazyGit<CR>', { noremap = true, silent = true })
