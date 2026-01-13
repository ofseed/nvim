---@type LazyPluginSpec
return {
  'folke/snacks.nvim',
  ---@module "snacks"
  ---@type snacks.Config
  opts = {
    input = {
      icon = ' ',
    },
    styles = {
      input = {
        title_pos = 'left',
        relative = 'cursor',
        row = 1,
        col = 0,
        width = 30,
      },
    },
  },
}
