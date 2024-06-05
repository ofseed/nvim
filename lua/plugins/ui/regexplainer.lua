local custom = require "custom"

---@type LazyPluginSpec
return {
  "bennypowers/nvim-regexplainer",
  -- Not very useful now
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  keys = { "gR", desc = "Toggle Regexplainer" },
  opts = {
    popup = {
      border = {
        style = custom.border,
      },
    },
  },
}
