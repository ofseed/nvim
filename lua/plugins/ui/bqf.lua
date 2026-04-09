---@type LazyPluginSpec
return {
  'kevinhwang91/nvim-bqf',
  -- https://github.com/kevinhwang91/nvim-bqf/issues/177
  enabled = false,
  ft = 'qf',
  dependencies = {
    {
      'junegunn/fzf',
    },
  },
  opts = {
    auto_resize_height = true,
    preview = {
      show_scroll_bar = false,
    },
  },
}
