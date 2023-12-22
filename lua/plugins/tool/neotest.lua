---@type LazyPluginSpec
return {
  "rcarriga/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = function()
    return {}
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
