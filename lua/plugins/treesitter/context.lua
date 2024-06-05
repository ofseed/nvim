---@type LazyPluginSpec
return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "VeryLazy",
  opts = {
    mode = "topline",
  },
  keys = {
    { "<leader>tc", "<Cmd>TSContextToggle<CR>", desc = "Treesitter Context" },
  },
}
