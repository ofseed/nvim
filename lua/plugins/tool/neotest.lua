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
  },
}
