return {
  "jay-babu/mason-nvim-dap.nvim",
  event = "VeryLazy",
  dependencies = {
    "mason.nvim",
    "mfussenegger/nvim-dap",
  },
  opts = function()
    return {
      handlers = {
        python = function() end,
      },
    }
  end,
}
