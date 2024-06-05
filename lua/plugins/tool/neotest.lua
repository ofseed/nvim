---@type LazyPluginSpec
return {
  "rcarriga/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",

    -- Adapters
    "nvim-neotest/neotest-jest",
    "nvim-neotest/neotest-go",
  },
  opts = function()
    return {
      adapters = {
        require "neotest-jest",
        require "neotest-go",
      },
      consumers = {
        overseer = require "neotest.consumers.overseer",
      },
    }
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

    {
      "<leader>Tm",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Summary",
    },
    {
      "<leader>Tw",
      function()
        require("neotest").watch.toggle()
      end,
      desc = "Watch",
    },
    {
      "<leader>To",
      function()
        require("neotest").output_panel.toggle()
      end,
      desc = "Output panel",
    },
  },
}
