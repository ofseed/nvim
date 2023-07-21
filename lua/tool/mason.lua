local custom = require "custom"

local opts = {
  ui = {
    border = custom.border,
  },
}

return {
  "williamboman/mason.nvim",
  opts = opts,
}
