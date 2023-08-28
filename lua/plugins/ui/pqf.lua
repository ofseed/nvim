local custom = require "custom"

local signs = vim.tbl_extend("keep", {
  warning = custom.icons.diagnostic.warn,
}, custom.icons.diagnostic)

return {
  "yorickpeterse/nvim-pqf",
  opts = {
    signs = signs,
  },
}
