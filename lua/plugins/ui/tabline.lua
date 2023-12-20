---@type LazyPluginSpec
return {
  "mg979/tabline.nvim",
  enabled = false,
  init = function()
    vim.o.showtabline = 2
  end,
  opts = {},
  config = function(_, opts)
    local tabline = require "tabline.setup"

    tabline.setup(opts)
    tabline.mappings(true)
  end,
}
