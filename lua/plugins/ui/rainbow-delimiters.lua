---@type LazyPluginSpec
return {
  "HiPhish/rainbow-delimiters.nvim",
  event = "VeryLazy",
  opts = {
    query = {
      latex = "rainbow-blocks",
      lua = "rainbow-blocks",
      query = "rainbow-blocks",
      verilog = "rainbow-blocks",
    },
  },
  config = function(_, opts)
    vim.g.rainbow_delimiters = opts
  end,
}
