---@type LazyPluginSpec
return {
  'neovim/nvim-lspconfig',
  event = {
    'Filetype',
  },
  dependencies = {
    'folke/neoconf.nvim',
  },
}
