return {
  "jay-babu/mason-nvim-dap.nvim",
  -- Only load when nvim-dap loads
  lazy = true,
  dependencies = {
    "mason.nvim",
  },
  opts = function()
    return {
      handlers = {
        codelldb = function(config)
          config.adapters = {
            type = "server",
            port = "${port}",
            executable = {
              command = vim.fn.exepath "codelldb",
              args = {
                "--port",
                "${port}",
                "--settings",
                vim.json.encode {
                  showDisassembly = "never",
                },
              },
            },
          }
          config.configurations = {
            {
              name = "Launch active file",
              type = "codelldb",
              request = "launch",
              program = "${fileBasenameNoExtension}",
              cwd = "${workspaceFolder}",
              stopOnEntry = false,
              args = {},
              console = "integratedTerminal",
              preLaunchTask = "C++ build single file",
            },
          }
          require("mason-nvim-dap").default_setup(config)
        end,
        python = function() end,
        delve = function() end,
      },
    }
  end,
}
