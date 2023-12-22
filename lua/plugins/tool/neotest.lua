---@type LazyPluginSpec
return {
  "rcarriga/neotest",
  lazy = true,
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
}
