return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = {
        formatters = { "isort", "black" },
        run_all_formatters = true,
      },
      go = {
        formatters = { "gofumpt", "goimports" },
        run_all_formatters = true,
      },

      html = { "prettier" },
      css = { "prettier" },
      less = { "prettier" },
      scss = { "prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      vue = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
    },
  },
  keys = {
    {
      "<leader>F",
      function()
        require("conform").format { lsp_fallback = true }
      end,
      desc = "Format Document",
    },
  },
}
