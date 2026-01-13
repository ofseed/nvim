---@type LazyPluginSpec
return {
  'kylechui/nvim-surround',
  event = 'VeryLazy',
  opts = {
    keymaps = {
      insert = false,
      insert_line = false,
    },
  },
}
