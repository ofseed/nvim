return {
  "jay-babu/mason-null-ls.nvim",
  event = "VeryLazy",
  dependencies = {
    { "williamboman/mason.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "jose-elias-alvarez/null-ls.nvim" },
  },
  opts = {
    automatic_setup = true,
    handlers = {},
  },
}
