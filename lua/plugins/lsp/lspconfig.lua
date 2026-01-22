---@type LazyPluginSpec
return {
  'neovim/nvim-lspconfig',
  event = {
    'Filetype',
  },
  dependencies = {
    'folke/neoconf.nvim',
  },
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
