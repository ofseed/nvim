---@type LazyPluginSpec
return {
  'hedyhli/outline.nvim',
  keys = {
    { '<leader>a', '<Cmd>Outline<CR>', desc = 'Outline' },
  },
  opts = {
    preview_window = {
      live = true,
    },
    symbols = {
      icon_source = 'lspkind',
    },
  },
}
