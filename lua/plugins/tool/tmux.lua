---@type LazyPluginSpec
return {
  'aserowy/tmux.nvim',
  cond = vim.env.TMUX ~= nil,
  opts = {},
  event = 'VeryLazy',
}
