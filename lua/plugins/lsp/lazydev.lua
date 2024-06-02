return {
  "folke/lazydev.nvim",
  ft = "lua",
  opts = {
    library = {
      vim.fs.joinpath(vim.env.LAZY, "luvit-meta/library"),
    },
  },
}
