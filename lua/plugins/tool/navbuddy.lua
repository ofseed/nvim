---@type LazyPluginSpec
return {
  'SmiteshP/nvim-navbuddy',
  dependencies = {
    'neovim/nvim-lspconfig',
    'SmiteshP/nvim-navic',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    window = {
      size = {
        height = '60%',
        width = '80%',
      },
    },
    lsp = {
      auto_attach = true,
    },
  },
  keys = {
    {
      '<leader>n',
      function()
        require('nvim-navbuddy').open()
      end,
      desc = 'Symbol Navigator',
    },
  },
}
