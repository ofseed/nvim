---@type LazyPluginSpec
return {
  'mfussenegger/nvim-dap',
  init = function()
    vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticError' })
    vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DiagnosticError' })
    vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DiagnosticInfo' })
    vim.fn.sign_define('DapStopped', { text = '', texthl = 'Constant', linehl = 'debugPC' })
    vim.fn.sign_define('DapBreakpointRejected', { text = '' })
  end,
  dependencies = {
    'jay-babu/mason-nvim-dap.nvim',
    'LiadOz/nvim-dap-repl-highlights',
    'theHamsta/nvim-dap-virtual-text',
    'rcarriga/nvim-dap-ui',
  },
  config = function()
    local dap = require 'dap'
    dap.defaults.fallback.external_terminal = {
      command = '/usr/bin/kitty',
      args = {
        '--class',
        'kitty-dap',
        '--hold',
        '--detach',
        'nvim-dap',
        '-c',
        'DAP',
      },
    }

    dap.adapters['nvim-lua'] = function(callback, config)
      callback {
        type = 'server',
        host = config.host or '127.0.0.1',
        port = config.port or 8086,
      }
    end
    dap.configurations.lua = {
      {
        type = 'nvim-lua',
        request = 'attach',
        name = 'Attach to running Neovim instance',
      },
    }

    dap.adapters.gdb = {
      type = 'executable',
      command = 'gdb',
      args = { '-i', 'dap' },
    }

    dap.adapters.codelldb = {
      type = 'server',
      port = '${port}',
      executable = {
        command = vim.fn.exepath 'codelldb',
        args = {
          '--port',
          '${port}',
          '--settings',
          vim.json.encode {
            showDisassembly = 'never',
          },
        },
      },
    }
    vim
      .iter({
        {
          name = 'LLDB: Launch active file',
          type = 'codelldb',
          request = 'launch',
          program = '${fileBasenameNoExtension}',
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = {},
          console = 'integratedTerminal',
          preLaunchTask = 'C++ build single file',
        },

        {
          name = 'LLDB: Attach to a running process',
          type = 'codelldb',
          request = 'attach',
          pid = '${command:pickProcess}',
          stopOnEntry = true,
        },
      })
      :map(function(configuration)
        dap.configurations.cpp = dap.configurations.cpp or {}
        table.insert(dap.configurations.cpp, configuration)
      end)
    vim
      .iter({
        {
          name = 'LLDB: Launch a new process',
          type = 'codelldb',
          request = 'launch',
          program = '${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}',
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = {},
          console = 'integratedTerminal',
          preLaunchTask = 'zig build',
        },
        {
          name = 'LLDB: Launch a new process with arguments',
          type = 'codelldb',
          request = 'launch',
          program = '${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}',
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = function()
            local args = {}
            local input = vim.fn.input 'Enter program arguments: '
            if input ~= '' then
              for arg in vim.gsplit(input, ' ') do
                table.insert(args, arg)
              end
            end
            return args
          end,
          console = 'integratedTerminal',
          preLaunchTask = 'zig build',
        },
      })
      :map(function(configuration)
        dap.configurations.zig = dap.configurations.zig or {}
        table.insert(dap.configurations.zig, configuration)
      end)

    dap.adapters['pwa-node'] = {
      type = 'server',
      host = 'localhost',
      port = '${port}',
      executable = {
        command = vim.fn.exepath 'js-debug-adapter',
        args = { '${port}' },
      },
    }
    for _, filetype in ipairs { 'javascript', 'typescript' } do
      dap.configurations[filetype] = {
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          cwd = '${workspaceFolder}',
        },
      }
    end

    ---@diagnostic disable-next-line: undefined-field
    require('overseer').enable_dap(true)
    require('dap.ext.vscode').json_decode = require('overseer.json').decode
  end,
  keys = {
    {
      '<F5>',
      function()
        require('dap').continue()
      end,
      desc = 'Debug: Continue',
    },
    {
      '<F17>',
      function()
        require('dap').terminate()
      end,
      desc = 'Debug: Terminate',
    },
    {
      '<F10>',
      function()
        require('dap').step_over()
      end,
      desc = 'Debug: Step over',
    },
    {
      '<F11>',
      function()
        require('dap').step_into()
      end,
      desc = 'Debug: Step into',
    },
    {
      '<F23>', -- Shift + <F11>
      function()
        require('dap').step_out()
      end,
      desc = 'Debug: Step out',
    },
    {
      '<F9>',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Debug: Toggle breakpoint',
    },

    {
      '<leader>dp',
      function()
        local condition = vim.fn.input 'Breakpoint condition: '
        if condition == '' then
          return
        end
        require('dap').set_breakpoint(condition)
      end,
      desc = 'Set condition breakpoint',
    },
    {
      '<leader>dP',
      function()
        local message = vim.fn.input 'Log point message: '
        if message == '' then
          return
        end
        require('dap').set_breakpoint(nil, nil, message)
      end,
      desc = 'Set log point',
    },
    {
      '<leader>db',
      function()
        require('dap').list_breakpoints(true)
      end,
      desc = 'Open breakpoints',
    },
    {
      '<leader>dR',
      function()
        require('dap').repl.toggle()
      end,
      desc = 'Toggle REPL',
    },
    {
      '<leader>dl',
      function()
        require('dap').run_last()
      end,
      desc = 'Run last',
    },
  },
}
