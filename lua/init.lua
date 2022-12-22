require "plugins"

-- Load colorscheme after plugins are loaded
-- Only the configuration started the second time takes effect for the bufferline
vim.cmd "silent! colorscheme catppuccin"
