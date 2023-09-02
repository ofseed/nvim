return {
  "mfussenegger/nvim-treehopper",
  enabled = false,
  keys = {
    { "m", ":<C-U>lua require('tsht').nodes()<CR>", mode = "o" },
    { "m", ":lua require('tsht').nodes()<CR>", mode = "v" },
  },
}
