local custom = require "custom"

local opts = {
  automatic_setup = true,
  handlers = {},
}

return {
  "jay-babu/mason-null-ls.nvim",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "jose-elias-alvarez/null-ls.nvim" },
  },
  after = "mason.nvim",
  init = function()
    require("null-ls").setup {
      border = custom.border,
      fallback_severity = vim.diagnostic.severity.INFO,
    }
  end,
  opts = opts,
}
