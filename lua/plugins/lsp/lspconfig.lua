local custom = require "custom"

return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    require("lspconfig.ui.windows").default_options.border = custom.border
  end,
  keys = {
    {
      "<leader>lr",
      function()
        vim.cmd.LspRestart()
      end,
      desc = "Reload",
    },
    {
      "<leader>li",
      function()
        vim.cmd.LspInfo()
      end,
      desc = "Reload",
    },
  },
}
