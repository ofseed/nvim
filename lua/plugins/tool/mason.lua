---@type LazyPluginSpec
return {
  'williamboman/mason.nvim',
  lazy = false,
  opts = {},
  keys = {
    { '<leader>mm', '<Cmd>Mason<CR>', desc = 'Packages' },
  },
}
