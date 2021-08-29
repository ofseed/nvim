local vim = vim

require('lualine').setup {
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
