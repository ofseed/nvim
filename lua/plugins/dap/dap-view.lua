---@type LazyPluginSpec
return {
  'igorlfs/nvim-dap-view',
  ---@module 'dap-view'
  ---@type dapview.Config
  opts = {
    winbar = {
      default_section = 'threads',
      controls = {
        enabled = true,
      },
    },
    virtual_text = {
      enabled = true,
    },
    icons = {
      collapsed = ' ',
      expanded = ' ',
    },
    switchbuf = vim.o.switchbuf,
    auto_toggle = true,
    follow_tab = true,
  },
  keys = {
    {
      '<leader>dv',
      function()
        require('dap-view').toggle()
      end,
      desc = 'Toggle DAP view',
    },
    {
      '<leader>dt',
      function()
        require('dap-view').virtual_text_toggle()
      end,
      desc = 'Toggle DAP virtual text',
    },
  },
}
