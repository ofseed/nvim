return {
  "nvim-treesitter/playground",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = { "TSPlaygroundToggle" },
  keys = {
    { "<leader>tp", "<Cmd>TSPlaygroundToggle<CR>", desc = "Treesitter Playground" },
  },
}
