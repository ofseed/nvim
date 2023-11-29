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
          config.configurations = {
            vim.tbl_extend("force", config.configurations[1], {
              program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
              end,
              showDisassembly = "never",
            }),
          }
          require("mason-nvim-dap").default_setup(config)
        end,
        python = function() end,
      },
    }
  end,
}
