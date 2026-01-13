local api = vim.api
local keymap = vim.keymap

local bufnr = api.nvim_get_current_buf()
local winid = api.nvim_get_current_win()

-- Avoid opening other buffers in the quickfix window.
vim.wo[winid][0].winfixbuf = true

keymap.set('n', 'q', '<Cmd>close<CR>', { desc = 'Close Quickfix', buffer = bufnr })
