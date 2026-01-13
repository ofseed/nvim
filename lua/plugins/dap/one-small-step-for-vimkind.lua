---@type LazyPluginSpec
return {
  'jbyuki/one-small-step-for-vimkind',
  keys = {
    {
      '<leader>hd',
      function()
        require('osv').launch { port = 8086 }
      end,
      desc = 'Launch adapter',
    },
    {
      '<leader>hs',
      function()
        require('osv').stop()
      end,
      desc = 'Stop adapter',
    },
  },
}
