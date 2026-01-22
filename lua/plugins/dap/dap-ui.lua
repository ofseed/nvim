---@type LazyPluginSpec
return {
  'rcarriga/nvim-dap-ui',
  ---@type dapui.Config
  opts = {
    icons = {
      collapsed = '',
      current_frame = '',
      expanded = '',
    },
  },
  keys = {
    {
      '<leader>du',
      function()
        require('dapui').toggle()
      end,
      desc = 'Toggle full UI',
    },
    {
      '<C-k>',
      function()
        require('dapui').eval()
      end,
      desc = 'Evaluate expression',
      mode = { 'n', 'v' },
    },

    {
      '<leader>ds',
      function()
        require('dapui').float_element('stacks', {
          width = 60,
          height = 20,
          enter = true,
          position = 'center',
        })
      end,
      desc = 'Open stacks',
    },
    {
      '<leader>dw',
      function()
        require('dapui').float_element('watches', {
          width = 60,
          height = 20,
          enter = true,
          position = 'center',
        })
      end,
      desc = 'Open watches',
    },
    {
      '<leader>dv',
      function()
        require('dapui').float_element('scopes', {
          width = 60,
          height = 20,
          enter = true,
          position = 'center',
        })
      end,
      desc = 'Open scopes',
    },
    {
      '<leader>dc',
      function()
        require('dapui').float_element('console', {
          width = 60,
          height = 20,
          enter = true,
          position = 'center',
        })
      end,
      desc = 'Open console',
    },
    {
      '<leader>dr',
      function()
        require('dapui').float_element('repl', {
          width = 60,
          height = 20,
          enter = true,
          position = 'center',
        })
      end,
      desc = 'Open repl',
    },
  },
}
