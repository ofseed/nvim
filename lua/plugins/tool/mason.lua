local custom = require 'custom'

---@type LazyPluginSpec
return {
  'williamboman/mason.nvim',
  lazy = false,
  opts = {
    ui = {
      border = custom.border,
    },
  },
  keys = {
    { '<leader>mm', '<Cmd>Mason<CR>', desc = 'Packages' },
  },
}
