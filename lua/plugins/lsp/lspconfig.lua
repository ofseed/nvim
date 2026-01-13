local custom = require 'custom'

---@type LazyPluginSpec
return {
  'neovim/nvim-lspconfig',
  event = {
    'Filetype',
  },
  dependencies = {
    'folke/neoconf.nvim',
  },
  config = function()
    require('lspconfig.ui.windows').default_options.border = custom.border
  end,
  keys = {
    {
      '<leader>lR',
      function()
        vim.cmd.LspRestart()
      end,
      desc = 'Reload',
    },
    {
      '<leader>lI',
      function()
        vim.cmd.LspInfo()
      end,
      desc = 'Info',
    },
  },
}
