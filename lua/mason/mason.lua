local ok, mason = pcall(require, "mason")
if not ok then
  vim.notify "Could not load mason"
end

local custom = require "custom"

mason.setup {
  ui = {
    border = custom.border,
  },
}
