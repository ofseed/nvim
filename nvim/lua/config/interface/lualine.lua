local vim = vim
local lualine = require'lualine'

lualine.setup {
  options = {
    theme = vim.g.colors_name,
    disabled_filetypes = {
      'dashboard'
    }
  },
  extensions = {
    'nvim-tree',
  }
}
