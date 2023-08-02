local custom = require "custom"

return {
  "Bekaboo/dropbar.nvim",
  opts = {
    icons = {
      kinds = {
        symbols = custom.icons.kind_with_space,
      },
    },
  },
}
