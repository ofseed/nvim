---@type LazyPluginSpec
return {
  'ofseed/nvim-bqf',
  branch = 'native-open',
  -- https://github.com/kevinhwang91/nvim-bqf/issues/177
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
