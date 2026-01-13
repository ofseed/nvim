---@type LazyPluginSpec
return {
  'chrishrb/gx.nvim',
  keys = {
    {
      'gx',
      function()
        vim.cmd.Browse()
      end,
    },
  },
  cmd = {
    'Browse',
  },
  opts = {},
}
