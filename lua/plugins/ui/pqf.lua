local custom = require "custom"

local signs = vim.tbl_extend("keep", {
  warning = custom.icons.diagnostic.warn,
}, custom.icons.diagnostic)

---@type LazyPluginSpec
return {
  "yorickpeterse/nvim-pqf",
  event = "VeryLazy",
  opts = {
    signs = signs,
  },
}
