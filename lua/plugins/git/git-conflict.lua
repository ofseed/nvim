---@type LazyPluginSpec
return {
  'akinsho/git-conflict.nvim',
  event = 'VeryLazy',
  opts = {
    default_mappings = {
      ours = 'co',
      theirs = 'ct',
      none = 'c0',
      both = 'cb',
      next = ']x',
      prev = '[x',
    },
  },
}
