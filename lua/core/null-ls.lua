local ok, ls = pcall(require, "null-ls")
if not ok then
  vim.notify "Could not load null-ls"
  return
end

local os, mason = pcall(require, "mason-null-ls")

local custom = require "custom"

mason.setup {
  automatic_setup = true,
  handlers = {},
}

ls.setup {
  border = custom.border,
  fallback_severity = vim.diagnostic.severity.INFO,
}
