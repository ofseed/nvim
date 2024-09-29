---@type LazyPluginSpec
return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "VeryLazy",
  opts = {
    max_lines = 5,
    mode = "topline",
  },
  keys = {
    { "<leader>tc", "<Cmd>TSContextToggle<CR>", desc = "Treesitter Context" },
  },
}
