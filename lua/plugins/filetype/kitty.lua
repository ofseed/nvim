---@type LazyPluginSpec
return {
  'fladson/vim-kitty',
  event = { 'BufReadPre kitty.conf' },
}
