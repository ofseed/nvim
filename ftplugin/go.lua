local api = vim.api

local bufnr = api.nvim_get_current_buf()

-- For tab-based indentation
vim.bo[bufnr].tabstop = 4
vim.bo[bufnr].shiftwidth = 4
vim.bo[bufnr].expandtab = false
