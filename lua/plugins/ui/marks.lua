---@type LazyPluginSpec
return {
  'chentoast/marks.nvim',
  event = 'VeryLazy',
  opts = {
    sign_priority = { lower = 10, upper = 15, builtin = 5, bookmark = 20 },
    excluded_buftypes = { 'nofile' },
  },
}
