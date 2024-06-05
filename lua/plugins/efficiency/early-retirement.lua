local custom = require "custom"

---@type LazyPluginSpec
return {
  "chrisgrieser/nvim-early-retirement",
  cond = custom.prefer_tabpage,
  event = "VeryLazy",
  opts = {},
}
