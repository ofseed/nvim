return {
  "mg979/tabline.nvim",
  enabled = false,
  init = function()
    vim.o.showtabline = 2
  end,
  config = function()
    local tabline = require "tabline.setup"

    tabline.setup()
    tabline.mappings(true)
  end,
}
