local custom = require "custom"

return {
  "jose-elias-alvarez/null-ls.nvim",
  event = "VeryLazy",
  opts = {
    border = custom.border,
    fallback_severity = vim.diagnostic.severity.INFO,
  },
}
