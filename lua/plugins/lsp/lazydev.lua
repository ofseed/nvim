---@type LazyPluginSpec
return {
  ---@module 'lazydev'
  'folke/lazydev.nvim',
  ft = 'lua',
  ---@type lazydev.Config
  opts = {
    library = {
      {
        path = 'luvit-meta/library',
        words = { 'vim%.uv' },
      },
      {
        path = 'lazy.nvim',
        words = { 'Lazy.*Spec' },
      },
    },
  },
}
