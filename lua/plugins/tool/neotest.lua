---@type LazyPluginSpec
return {
  "rcarriga/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",

    -- Adapters
    "nvim-neotest/neotest-jest",
  },
  opts = function()
    return {
      adapters = {
        require "neotest-jest",
      },
      consumers = {
        overseer = require "neotest.consumers.overseer",
      },
    }
  end,
  config = function(_, opts)
    require("neotest").setup(opts)
  end,
  keys = {
    {
      "<leader>Tr",
      function()
        require("neotest").run.run()
      end,
      desc = "Run",
    },
    {
      "<leader>Ts",
      function()
        require("neotest").run.stop()
      end,
      desc = "Stop",
    },
    {
      "<leader>Ta",
      function()
        require("neotest").run.attach()
      end,
      desc = "Attach",
    },
  },
}
