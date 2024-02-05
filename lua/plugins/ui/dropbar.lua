local custom = require "custom"

return {
  "Bekaboo/dropbar.nvim",
  opts = {
    icons = {
      kinds = {
        symbols = custom.icons.kind_with_space,
      },
    },
    sources = {
      path = {
        modified = function(sym)
          return sym:merge {
            name = sym.name .. " [+]",
            name_hl = "DiffAdded",
          }
        end,
      },
    },
  },
}
