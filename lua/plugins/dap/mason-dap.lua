---@type LazyPluginSpec
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
          config.configurations = {}
          require("mason-nvim-dap").default_setup(config)
        end,
        js = function(config)
          config.name = "pwa-node"
          config.adapters = {
            type = "server",
            host = "localhost",
            port = "${port}",
            executable = {
              command = vim.fn.exepath "js-debug-adapter",
              args = { "${port}" },
            },
          }
          config.configurations = {
            {
              type = "pwa-node",
              request = "launch",
              name = "Launch file",
              program = "${file}",
              cwd = "${workspaceFolder}",
            },
          }
          config.filetypes = { "javascript" }
          require("mason-nvim-dap").default_setup(config)
        end,

        -- Ignored adapters
        python = function() end,
        delve = function() end,
      },
    }
  end,
}
