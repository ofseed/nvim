return {
  "neovim/nvim-lspconfig",
  lazy = false,
  keys = {
    {
      "<leader>lr",
      function()
        vim.cmd.LspRestart()
      end,
      desc = "Reload",
    },{
      "<leader>li",
      function()
        vim.cmd.LspInfo()
      end,
      desc = "Reload",
    }
  },
}
