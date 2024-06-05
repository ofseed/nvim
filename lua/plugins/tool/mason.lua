local custom = require "custom"

local opts = {
  ui = {
    border = custom.border,
  },
}

---@type LazyPluginSpec
return {
  "williamboman/mason.nvim",
  opts = opts,
  keys = {
    { "<leader>mm", "<Cmd>Mason<CR>", desc = "Packages" },
  },
}
