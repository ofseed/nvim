local custom = require "custom"

return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  opts = {
    input = {
      border = custom.border,
    },
    select = {
      builtin = {
        border = custom.border,
      },
    },
  },
}
