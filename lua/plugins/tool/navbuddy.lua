local custom = require "custom"

return {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    window = {
      border = custom.border,
      size = {
        height = "60%",
        width = "80%",
      },
    },
    icons = custom.icons.kind_with_space,
    lsp = {
      auto_attach = true,
    },
  },
  keys = {
    {
      "<leader>N",
      function()
        require("nvim-navbuddy").open()
      end,
      desc = "Symbol Navigator",
    },
  },
}
