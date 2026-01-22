---@type LazyPluginSpec
return {
  'stevearc/aerial.nvim',
  enabled = false,
  opts = {
    backends = { 'lsp', 'treesitter', 'markdown' },
  },
  keys = {
    { '<leader>a', '<Cmd>AerialToggle<CR>', desc = 'Outline' },
  },
}
