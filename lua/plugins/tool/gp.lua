---@type LazyPluginSpec
return {
  "https://github.com/Robitx/gp.nvim",
  cond = vim.env.OPENAI_API_KEY ~= nil,
  event = "VeryLazy",
  opts = {},
  config = function(_, opts)
    require("gp").setup(opts)
  end,
}
