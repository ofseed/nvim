local custom = require "custom"

return {
  "stevearc/oil.nvim",
  opts = {
    float = {
      border = custom.border,
    },
    preview = {
      border = custom.border,
    },
    progress = {
      border = custom.border,
    },
  },
}
