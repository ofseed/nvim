local custom = require 'custom'

---@type LazyPluginSpec
return {
  'NStefan002/screenkey.nvim',
  cmd = 'Screenkey',
  opts = {
    win_opts = {
      border = custom.border,
    },
  },
}
