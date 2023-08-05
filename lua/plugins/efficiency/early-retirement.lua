local custom = require "custom"

return {
  "chrisgrieser/nvim-early-retirement",
  cond = custom.prefer_tabpage,
  event = "VeryLazy",
  opts = {},
}
