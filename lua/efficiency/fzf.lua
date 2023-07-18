return {
  "junegunn/fzf",
  build = function()
    vim.fn["fzf#install"]()
  end,
  event = "VeryLazy",
}
